/* --------------------------------------------------------------------------------------------
 * Copyright (c) David Owens II (owensd.io). All rights reserved.
 * Licensed under the MIT License. See License.md in the project root for license information.
 * ------------------------------------------------------------------------------------------ */
'use strict';

import {
	IPCMessageReader, IPCMessageWriter,
	createConnection, IConnection,
	Diagnostic, DiagnosticSeverity,
	TextDocument, TextDocuments, TextDocumentSyncKind, TextDocumentPositionParams,
	InitializeParams, InitializeResult,
	CompletionItem, CompletionItemKind
} from 'vscode-languageserver';

let connection: IConnection = createConnection(new IPCMessageReader(process), new IPCMessageWriter(process));

let documents: TextDocuments = new TextDocuments();
documents.listen(connection);

let workspaceRoot: string;
connection.onInitialize((params): InitializeResult => {
	workspaceRoot = params.rootPath;
	return {
		capabilities: {
			textDocumentSync: documents.syncKind,
			completionProvider: {
				resolveProvider: true
			}
		}
	}
});

documents.onDidChangeContent((change) => {
	connection.console.log('We recevied an file change event');
});

connection.onDidChangeWatchedFiles((change) => {
	connection.console.log('We recevied an file change event');
});

connection.onCompletion((textDocumentPosition: TextDocumentPositionParams): CompletionItem[] => {
	return [
	]
});

connection.onCompletionResolve((item: CompletionItem): CompletionItem => {
	return item;
});

connection.onDidOpenTextDocument((params) => {
	connection.console.log(`${params.textDocument} opened.`);
});

connection.onDidChangeTextDocument((params) => {
	connection.console.log(`${params.textDocument} changed: ${JSON.stringify(params.contentChanges)}`);
});

connection.onDidCloseTextDocument((params) => {
	connection.console.log(`${params.textDocument} closed.`);
});

// Listen on the connection
connection.listen();