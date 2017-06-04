# Swift for Visual Studio Code

An extension for VS Code which provides support for the Swift language, providing the following:

  * Completion Lists
  * Signature Help
  * Snippets
  * Quick Info
  * Goto Definition

Please note that this extension will *ONLY* work with Swift Package Manager projects for the time
being. If a `Package.swift` file is not in the root of your project, this extension will fail.

Also note, this is an early beta release. There will be bugs. Please file any issues you run into
over here: https://github.com/owensd/vscode-swift.

## Installation

Obviously, you'll need to have Visual Studio Code installed. Then search for the `Swift for Visual
Studio Code` extension from the command palette (`cmd+shift+p`|`ctrl+shift+p`).

You'll need to ensure that the `swift` tool is on your command path is one of the supported
versions. As of now, only Swift 3.1 is supported. If you are using development snapshots, you can
configure your project to use the correct version of Swift with the `swift-langsrv.

> _Note:_ It is entirely possible to use development snapshots. However, they are untested and
> unsupported. The problem is that the SourceKit binary may simply not load for mis-matched versions
> of Swift.
>
>   `swift.toolchainPath` - the path to the root of the Swift toolchain, for example:
>                           `/Library/Developer/Toolchains/swift-3.1.1-RELEASE.xctoolchain`

### macOS

If you have the correct version of Swift installed, there is no other action necessary as all of the
dependencies are installed for you.


### Linux (in progress)

The fundamental problem is Swift 3.1 does not build with SourceKit... this is being addressed in
Swift 4. There are workarounds that I will published within the next few releases.

### Windows Linux Subsystem (experimental)

This setup is identical as the Linux setup with the exception of some additional Visual Studio Code
setup that is required. For one, the default shell needs to point to `C:\Windows\sysnative\bash.exe`.
This should be enough to get you going, but your mileage may vary here. In later versions, this will
be more flushed out as there are still reliability issues with `swift` itself in this environment.

## Swift JIRA Bug Links

The extension also provides easy hot-links to any of the Swift bugs with a specially crafted comment
`// SwiftBug(SR-2688)`. You can disable this feature with the `kiad.swift.enableSwiftBugLinks`
setting.

## License
[MIT](LICENSE)