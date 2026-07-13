// swift-tools-version: 6.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "OProximoAporteKit",
    defaultLocalization: "pt-BR",
    platforms: [
        .iOS(.v18)
    ],
    products: [
        .library(
            name: "OProximoAporteKit",
            targets: ["OProximoAporteKit"]
        ),
    ],
    targets: [
        .target(
            name: "OProximoAporteKit",
            swiftSettings: [
                .swiftLanguageMode(.v6)
            ]
        ),
        .testTarget(
            name: "OProximoAporteKitTests",
            dependencies: ["OProximoAporteKit"],
            swiftSettings: [
                .swiftLanguageMode(.v6)
            ]
        ),
    ]
)
