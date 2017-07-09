// swift-tools-version:4.0

import PackageDescription

let package = Package(
    name: "truncate.swift",
    products: [
        .library(
            name: "truncate.swift",
            targets: ["truncate.swift"]),
    ],
    targets: [
        .target(
            name: "truncate.swift",
            dependencies: []),
        .testTarget(
            name: "truncate.swiftTests",
            dependencies: ["truncate.swift"]),
    ]
)
