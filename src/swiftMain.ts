/*---------------------------------------------------------
 * Copyright (C) David Owens II. All rights reserved.
 *--------------------------------------------------------*/

'use strict';

import vscode = require('vscode');
import fs = require('fs');

let diagnosticCollection: vscode.DiagnosticCollection;

export function activate(ctx: vscode.ExtensionContext): void {
}

function deactivate() {
}

function runBuilds(document: vscode.TextDocument, goConfig: vscode.WorkspaceConfiguration) {
}

function startBuildOnSaveWatcher(subscriptions: vscode.Disposable[]) {
}