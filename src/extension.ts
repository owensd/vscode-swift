/* --------------------------------------------------------------------------------------------
 * Copyright (c) Kiad Studios, LLC. All rights reserved.
 * Licensed under the MIT License. See License in the project root for license information.
 * ------------------------------------------------------------------------------------------ */
'use strict';

import * as path from 'path';
import * as fs from 'fs';

import { window, languages, workspace, Uri, Range, Disposable, ExtensionContext, TextDocument, CancellationToken, DocumentLink, extensions } from 'vscode';
import { LanguageClient, LanguageClientOptions, SettingMonitor, ServerOptions, TransportKind } from 'vscode-languageclient';

let languageServerId = 'swift';

function normalize(path: string): string {
	if (path.charAt(0) != '/') {
		let extensionPath = extensions.getExtension('kiadstudios.Apous').extensionPath;
		return extensionPath + '/' + path
	}
	return path
}

function registerSwiftBugLinkProvider(context: ExtensionContext) {
	// Provides easy access to Swift bugs.
	// example:
	// SwiftBug(SR-2688)
	let disposableSwiftBugLinkProvider = languages.registerDocumentLinkProvider('swift', {
		provideDocumentLinks: function(document: TextDocument, token: CancellationToken): DocumentLink[] {
			let links: DocumentLink[] = [];
			let re = /(SwiftBug\((SR-\d+)\))/g;
			let documentText = document.getText();
			
			var match
			while ((match = re.exec(documentText)) != null) {
				let pos = document.positionAt(match.index);
				let range = new Range(pos, pos.translate(0, match[0].length + 1));
				if (match[1]) {
					let uri = Uri.parse('https://bugs.swift.org/browse/' + match[2]);
					links.push(new DocumentLink(range, uri));
				}
			}
			return links;
		}
	});
	context.subscriptions.push(disposableSwiftBugLinkProvider);
}

// Launches the Swift Language Server tool.
function registerSwiftLanguageServer(context: ExtensionContext) {
	let config = workspace.getConfiguration(languageServerId);
	let langsrvPath = normalize(config.get('languageServerPath', 'lib/usr/bin/langsrv'));
	let debugOptions = ["--nolazy", "--debug=6009"];

	fs.exists(langsrvPath, (exists: boolean) => {
		if (exists) {
			let serverOptions: ServerOptions = {
				run : { command: langsrvPath },
				debug: { command: langsrvPath, args: debugOptions }
			}
			
			let clientOptions: LanguageClientOptions = {
				documentSelector: ['swift'],
				synchronize: {
					configurationSection: languageServerId,
					fileEvents: workspace.createFileSystemWatcher('**/.swift')
				}
			}
			
			let swiftLanguageServer = new LanguageClient(languageServerId, 'Swift Language Server', serverOptions, clientOptions);
			context.subscriptions.push(swiftLanguageServer.start());
		}
		else {
			window.showErrorMessage('There was no language server tool at the given path: ' + langsrvPath);
		}
	});
}

export function activate(context: ExtensionContext) {
	let config = workspace.getConfiguration(languageServerId);

	let enableBugLinks = config.get('enableSwiftBugLinks', true);
	if (enableBugLinks) { registerSwiftBugLinkProvider(context); }

	let enableLanguageServer = config.get('enableLanguageServer', true);
	if (enableLanguageServer) { registerSwiftLanguageServer(context); }
}
