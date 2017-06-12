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
let extensionPath = '';

// The version of the language server known to work with this extension.
let languageServerAssetsUrl = "https://github.com/owensd/swift-langsrv/releases/download/v0.16.1/langsrv-macos-v0.16.1.zip"

function normalize(path: string): string {
	if (path.charAt(0) != '/') {
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
					fileEvents: workspace.createFileSystemWatcher('**/.swift'),
				}
			}
			
			let swiftLanguageServer = new LanguageClient(languageServerId, 'Swift Language Server', serverOptions, clientOptions);
			context.subscriptions.push(swiftLanguageServer.start());
		}
		else {
			// download the language server
			let tmpPath = normalize('tmp');
			let libPath = normalize(path.join('lib', 'usr', 'bin'));
			if (!fs.existsSync(tmpPath)) { fs.mkdirSync(tmpPath); }
			if (!fs.existsSync(libPath)) {
				fs.mkdirSync(normalize('lib'));
				fs.mkdirSync(normalize(path.join('lib', 'usr')));
				fs.mkdirSync(libPath);
			}

			let tmpAssetsPath = path.join(tmpPath, 'assets.zip');
			let channel = window.createOutputChannel("Swift");
			channel.appendLine('Downloading Language Server assets from ' + languageServerAssetsUrl);
			channel.show();

			request(languageServerAssetsUrl)
				.pipe(fs.createWriteStream(tmpAssetsPath))
				.on('close', function () {
					channel.appendLine('Assets downloaded to: ' + tmpAssetsPath);
					channel.appendLine('Extracting assets to ' + libPath);

					fs.createReadStream(tmpAssetsPath)
						.pipe(unzip.Extract({path: libPath}))
							.on('close', function () {
								fs.chmod(path.join(libPath, 'langsrv'), "755");
								window.showInformationMessage('You will need to reload the window to load the language server.', 'Reload Window')
									.then(function (value) {
										commands.executeCommand('workbench.action.reloadWindow');
									});				
							})
							.on('error', function (e) {
								channel.appendLine('Error: ' + e);
								window.showErrorMessage('There was an error unpacking the language server assets from: ' + tmpAssetsPath);
							});
				})
				.on('error', function () {
					window.showErrorMessage('There was an error downloading the language server from: ' + languageServerAssetsUrl);
				});
		}
	});
}

export function activate(context: ExtensionContext) {
	extensionPath = context.extensionPath;
	let config = workspace.getConfiguration(languageServerId);

	let enableBugLinks = config.get('enableSwiftBugLinks', true);
	if (enableBugLinks) { registerSwiftBugLinkProvider(context); }

	let enableLanguageServer = config.get('enableLanguageServer', true);
	if (enableLanguageServer) { registerSwiftLanguageServer(context); }
}
