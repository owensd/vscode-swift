/* --------------------------------------------------------------------------------------------
 * Copyright (c) Kiad Studios, LLC. All rights reserved.
 * Licensed under the MIT License. See License.md in the project root for license information.
 * ------------------------------------------------------------------------------------------ */
'use strict';

import * as path from 'path';

import { languages, workspace, Uri, Range, Disposable, ExtensionContext, TextDocument, CancellationToken, DocumentLink } from 'vscode';
import { LanguageClient, LanguageClientOptions, SettingMonitor, ServerOptions, TransportKind } from 'vscode-languageclient';

function registerSwiftBugLinkProvider(context: ExtensionContext) {
	// TODO(owensd): Hide this behind a configuration option.
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

function registerSwiftLanguageService(context: ExtensionContext) {
	let languageServerId = 'swiftLanguageService';

	// TODO(owensd): This needs to be better factored out...
	let langsrvPath = context.asAbsolutePath(path.join('..', 'langsrv', '.build', 'debug', 'swift-langsrv'));
	let debugOptions = ["--nolazy", "--debug=6009"];

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
	
	let swiftLanguageService = new LanguageClient(languageServerId, 'Swift Language Service', serverOptions, clientOptions);
	context.subscriptions.push(swiftLanguageService.start());
}

export function activate(context: ExtensionContext) {
	registerSwiftBugLinkProvider(context);
	registerSwiftLanguageService(context);
}
