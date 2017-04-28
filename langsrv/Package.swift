// swift-tools-version:3.1

import PackageDescription

let package = Package(
    name: "swift-langsrv",
    dependencies: [
    ],
    exclude: [
        "Config",
        "Database",
        "Localization",
        "Public",
        "Resources",
    ]
)
