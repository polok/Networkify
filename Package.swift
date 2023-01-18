// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Networkify",
    platforms: [.iOS(.v14), .tvOS(.v14)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "Networkify",
            targets: ["Networkify"]),
    ],
    dependencies: [
        .package(url: "https://github.com/Quick/Nimble.git", from: "11.2.1"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "Networkify",
            dependencies: []),
        .testTarget(
            name: "NetworkifyTests",
            dependencies: ["Networkify", "Nimble"]),
    ]
)
