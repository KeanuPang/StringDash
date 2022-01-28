// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "StringDash",
    products: [
        .library(
            name: "StringDash",
            targets: ["StringDash"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "StringDash",
            dependencies: []),
        .testTarget(
            name: "StringDashTests",
            dependencies: ["StringDash"]),
    ]
)
