# Swift for Visual Studio Code

An extension for VS Code which provides support for the Swift language, providing the following:

  * Completion Lists
  * Signature Help
  * Snippets
  * Quick Info
  * Goto Definition

## Installation

Obviously, you'll need to have Visual Studio Code installed. Then search for the `Swift for Visual
Studio Code` extension from the command palette (`cmd+shift+p`|`ctrl+shift+p`).

You'll need to ensure that the `swift` tool is on your command path is one of the supported
versions. As of now, only Swift 3.1 is supported. If you are using development snapshots, you can
configure your project to use the correct version of Swift with the `swift-langsrv.

> _Note:_ It is entirely possible to use development snapshots. However, they are untested and
> unsupported. The problem is that [SourceKitten][1] will need to be built to match the version of
> the toolchain that you would like to support. If you do have matching Swift and SourceKit versions
> though, you set the following settings:
>
>   `kiad.swift.sourcekittenPath` - the path to the location of the `sourcekitten` binary. >
>   `kiad.swift.toolchainPath` - the path to the root of the Swift toolchain, for example:
>                                `/Library/Developer/Toolchains/swift-3.1.1-RELEASE.xctoolchain`
>
> So long as the contract between the language server and `SourceKitten` has not changed, then this
> should work.

### macOS

If you have the correct version of Swift installed, there is no other action necessary as all of the
dependencies are installed for you.

### Linux (experimental)

I'm still fully testing the limitations and proper setup steps. In practice, you just need to set
the `kiad.swift.sourcekittenPath` and `kiad.swift.toolchainPath` to point to the correct location.
In addition, SourceKitten will need to be able to find the SourceKite library, which is more involved
as it requires a special version of Swift to be built for Linux. This should be addressed in Swift 4.

### Windows Linux Subsystem (experimental)

This setup is identical as the Linux setup with the exception of some additional Visual Studio Code
setup that is required. For one, the default shell needs to point to `C:\Windows\sysnative\bash.exe`.
This should be enough to get you going, but your mileage may vary here. In later versions, this will
be more flushed out as there are still reliability issues with `swift` itself in this environment.

## Swift JIRA Bug Links

The extension also provides easy hot-links to any of the Swift bugs with a specially crafted comment
`// SwiftBug(SR-2688)`. You can disable this feature with the `kiad.swift.enableSwiftBugLinks`
setting.
