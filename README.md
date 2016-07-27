[![Build Status](https://travis-ci.org/owensd/vscode-swift.svg?branch=master)](https://travis-ci.org/owensd/vscode-swift)

** NOTE: THIS IS A WORK IN PROGRESS!!!! **

# vscode-swift
An extension for VS Code which provides support for the Swift language, because, let's face it, Xcode is imply not a joy to use.

The extension is broken up into parts:

  1. `src` - the part of the extension that is loaded within the process space of VS Code.
  2. `langsrv` - the out-of-process language service used by the extension.

