## 0.6.0 - June 3, 2017
This is a big infrastructural update as the binaries for the language server are no longer packaged
within the extension any longer. Instead, they are downloaded on first run. This provides excellent
ground work for support multiple platforms with a light-weight extension download.

Other fixes:
  - Fixed issue with the settings pulled from the wrong key.

## 0.5.5 - June 3, 2017
 - Packaged a new `langsrv` that fixes some `@rpath` issues that pointed to local user folders.

## 0.5.4 - June 3, 2017
 - Packaged a new `langsrv` tool that fixes some completion item errors on unsaved buffers,
   including a bug when at the end of the document.

## 0.5.3 - June 3, 2017
 - Updated the `README` to better reflect the published name.
 - Fixes to the `README` about configuration settings.
 - The packaged `langsrv` tool should now find your `sourcekitd` frameworks when using the Toolchain
   installs and Xcode.

