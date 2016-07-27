/* --------------------------------------------------------------------------------------------
 * Copyright (c) David Owens II (owensd.io). All rights reserved.
 * Licensed under the MIT License. See License.md in the project root for license information.
 * ------------------------------------------------------------------------------------------ */
'use strict';

import * as path from 'path';

import { workspace, Disposable, ExtensionContext } from 'vscode';
import { LanguageClient, LanguageClientOptions, SettingMonitor, ServerOptions, TransportKind } from 'vscode-languageclient';

export function activate(context: ExtensionContext) {

	console.log("activated!");
	// let serverModule = context.asAbsolutePath(path.join('server', 'langsrv.js'));
	// let debugOptions = { execArgv: ['--nolazy', '--debug=6004'] };
	
	// let serverOptions: ServerOptions = {
	// 	run : { module: serverModule, transport: TransportKind.ipc },
	// 	debug: { module: serverModule, transport: TransportKind.ipc, options: debugOptions }
	// }
	
	// let clientOptions: LanguageClientOptions = {
	// 	documentSelector: ['swift'],
	// 	synchronize: {
	// 		configurationSection: 'swiftlangsrv',
	// 		fileEvents: workspace.createFileSystemWatcher('Package.swift')
	// 	}
	// }
	
	// let langsrv = new LanguageClient('Swift Language Service', serverOptions, clientOptions).start();
	// context.subscriptions.push(langsrv);
}
