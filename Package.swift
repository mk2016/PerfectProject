// swift-tools-version:4.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "PerfectProject",
//    products: [
//        .library(
//            name: "PerfectProject",
//            targets: ["PerfectProject"]),
//    ],
    products: [
        .executable(name: "PerfectProject", targets: ["PerfectProject"]),
    ],
    dependencies: [
        .package(url: "https://github.com/PerfectlySoft/Perfect-HTTPServer.git", from: "3.0.0")
    ],
    targets: [
        .target(
            name: "PerfectProject",
            dependencies: ["PerfectHTTPServer"]),
        .testTarget(
            name: "PerfectProjectTests",
            dependencies: ["PerfectProject"]),
    ]
)

//let package = Package(
//    name: "PerfectProject",
//    targets: [],
//    dependencies: [
//        .Package(url: "https://github.com/PerfectlySoft/Perfect-HTTPServer.git", majorVersion: 3),
//    ]
//)
