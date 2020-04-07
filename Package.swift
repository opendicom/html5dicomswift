// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "html5dicomswift",
    dependencies: [
        .package(url: "https://github.com/vapor/mysql-nio.git", from: "1.0.0-rc.1"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "html5dicomswift",
            dependencies: [
                .product(name: "MySQLNIO", package: "mysql-nio"),
            ]),
        .testTarget(
            name: "html5dicomswiftTests",
            dependencies: ["html5dicomswift"]),
    ]
)
