// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Networkify",
    platforms: [.iOS(.v14), .tvOS(.v14)],
    products: [
        .library(
            name: "Networkify",
            targets: ["Networkify"]),
        .library(
            name: "RxNetworkify",
            targets: ["RxNetworkify"])
    ],
    dependencies: [
        .package(url: "https://github.com/ReactiveX/RxSwift.git", .upToNextMajor(from: "5.0.0")),
        .package(url: "https://github.com/Quick/Nimble.git", from: "11.2.1")
    ],
    targets: [
        .target(
            name: "Networkify",
            dependencies: []),
        .testTarget(
            name: "NetworkifyTests",
            dependencies: ["Networkify", "Nimble"]),
        .target(
            name: "RxNetworkify",
            dependencies: ["Networkify", "RxSwift"],
            path: "Sources/RxNetworkify")
    ]
)
