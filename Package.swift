// swift-tools-version:4.0

import PackageDescription

let package = Package(
    name: "truncate",
    products: [
        .library(
            name: "truncate",
            targets: ["truncate"]),
    ],
    targets: [
        .target(
            name: "truncate",
            dependencies: []),
        .testTarget(
            name: "truncateTests",
            dependencies: ["truncate"]),
    ]
)
