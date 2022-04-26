// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "TimeInWorldFeature",
    platforms: [.iOS(.v14)],
    products: [
        .library(
            name: "TimeInWorldFeature",
            targets: ["TimeInWorldFeature"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/pointfreeco/swift-composable-architecture", from: "0.33.1"),
        .package(url: "https://github.com/jrBordet/TimeInWords.git", from: "0.0.2"),
       // .package(url: "https://github.com/pointfreeco/swift-snapshot-testing.git", from: "1.9.0")
    ],
    targets: [
        .target(
            name: "TimeInWorldFeature",
            dependencies: [
                .product(name: "ComposableArchitecture", package: "swift-composable-architecture"),
                .product(name: "TimeInWords", package: "TimeInWords")
            ]
        ),
        .testTarget(
            name: "TimeInWorldFeatureTests",
            dependencies: [
                "TimeInWorldFeature",
                "TimeInWords",
               // .product(name: "SnapshotTesting", package: "SnapshotTesting"),
              //  .product(name: "SnapshotTesting", package: "SnapshotTesting")
//                "SnapshotTesting"
            ]
//            exclude: [
//              "__Snapshots__"
//            ]
        )
    ]
)
