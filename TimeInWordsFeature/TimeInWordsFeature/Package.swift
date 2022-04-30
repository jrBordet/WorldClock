// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "TimeInWordsFeature",
    platforms: [.iOS(.v14)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "TimeInWordsFeature",
            targets: ["TimeInWordsFeature"]),
    ],
    dependencies: [
        .package(url: "https://github.com/pointfreeco/swift-composable-architecture", from: "0.33.1"),
        .package(url: "https://github.com/jrBordet/TimeInWords.git", from: "0.0.2"),
        .package(url: "https://github.com/pointfreeco/swift-snapshot-testing.git", from: "1.9.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "TimeInWordsFeature",
            dependencies: [
                .product(name: "ComposableArchitecture", package: "swift-composable-architecture"),
                .product(name: "TimeInWords", package: "TimeInWords")
            ]),
        .testTarget(
            name: "TimeInWordsFeatureTests",
            dependencies: [
                "TimeInWordsFeature",
                "TimeInWords",
                .product(name: "SnapshotTesting", package: "swift-snapshot-testing")
            ]),
    ]
)
