/* --------------------------------------------------------------------------------------------
 * Copyright (c) Kiad Studios, LLC. All rights reserved.
 * Licensed under the MIT License. See License in the project root for license information.
 * ------------------------------------------------------------------------------------------ */
'use strict';

import * as path from 'path';
import * as fs from 'fs';
import * as request from 'request';
import * as unzip from 'unzip';

import { window, languages, workspace, commands, Uri, Range, Disposable, ExtensionContext, TextDocument, CancellationToken, DocumentLink, extensions } from 'vscode';
import { LanguageClient, LanguageClientOptions, SettingMonitor, ServerOptions, TransportKind } from 'vscode-languageclient';

let languageServerId = 'swift';

// The version of the language server known to work with this extension.
let languageServerAssetsUrl = "https://github.com/owensd/swift-langsrv/releases/download/v0.14.0/apous-macos-v0.14.0.zip"

function normalize(path: string): string {
	if (path.charAt(0) != '/') {
		let extensionPath = extensions.getExtension('kiadstudios.apous').extensionPath;
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
			// TODO(owensd): Think about doing PATCH level updates here.

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
			// download the language server
			let tmpPath = normalize('tmp');
			let libPath = normalize('lib/usr/bin');
			if (!fs.existsSync(tmpPath)) { fs.mkdirSync(tmpPath); }
			if (!fs.existsSync(libPath)) {
				fs.mkdirSync(normalize('lib'));
				fs.mkdirSync(normalize('lib/usr'));
				fs.mkdirSync(normalize('lib/usr/bin'));
			}

			let channel = window.createOutputChannel("Apous");
			channel.appendLine('Downloading Language Server assets from ' + languageServerAssetsUrl);
			channel.show();
			request(languageServerAssetsUrl)
				.pipe(fs.createWriteStream(tmpPath + '/assets.zip'))
				.on('close', function () {
					channel.appendLine('Assets downloaded to: ' + tmpPath + '/assets.zip');
					channel.appendLine('Extracting assets to ' + libPath);

					fs.createReadStream(tmpPath + '/assets.zip')
						.pipe(unzip.Extract({path: libPath}))
							.on('close', function () {
								fs.chmod(libPath + '/langsrv', "755");
								window.showInformationMessage('You will need to reload the window to load the language server.', 'Reload Window')
									.then(function (value) {
										commands.executeCommand('workbench.action.reloadWindow');
									});				
							})
							.on('error', function () {
								window.showErrorMessage('There was an error unpacking the language server assets from: ' + tmpPath + '/assets.zip');
							});
				})
				.on('error', function () {
					window.showErrorMessage('There was an error downloading the language server from: ' + languageServerAssetsUrl);
				});

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
