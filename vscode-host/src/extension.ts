/* --------------------------------------------------------------------------------------------
 * Copyright (c) Kiad Studios, LLC. All rights reserved.
 * Licensed under the MIT License. See License.md in the project root for license information.
 * ------------------------------------------------------------------------------------------ */
'use strict';

import * as path from 'path';

import { workspace, Disposable, ExtensionContext } from 'vscode';
import { LanguageClient, LanguageClientOptions, SettingMonitor, ServerOptions, TransportKind } from 'vscode-languageclient';

export function activate(context: ExtensionContext) {
	let languageServerId = 'swift-langsvr';

	let serverModule = context.asAbsolutePath(path.join('out', 'lngsvr', 'swift-langsvr.js'));
	let debugOptions = { execArgv: ["--nolazy", "--debug=6009"] };
	
	let serverOptions: ServerOptions = {
		run : { module: serverModule, transport: TransportKind.ipc },
		debug: { module: serverModule, transport: TransportKind.ipc, options: debugOptions }
	}
	
	let clientOptions: LanguageClientOptions = {
		documentSelector: ['swift'],
		synchronize: {
			configurationSection: languageServerId,
			fileEvents: workspace.createFileSystemWatcher('**/.clientrc')
		}
	}
	
	let disposable = new LanguageClient(languageServerId, 'Swift Language Service', serverOptions, clientOptions).start();
	context.subscriptions.push(disposable);
}
