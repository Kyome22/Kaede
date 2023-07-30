// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Kaede",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "Kaede",
            targets: ["Kaede"]
        ),
    ],
    targets: [
        .target(
            name: "Kaede"
        ),
        .testTarget(
            name: "KaedeTests",
            dependencies: ["Kaede"]
        )
    ]
)
