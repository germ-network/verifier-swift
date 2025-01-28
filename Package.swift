// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "TinfoilVerifier",
    platforms: [
        .iOS(.v17)
    ],
    products: [
        .library(
            name: "TinfoilVerifier",
            targets: ["TinfoilVerifierSwift"])
    ],
    targets: [
        .target(
            name: "TinfoilVerifierSwift",
            dependencies: [
                "TinfoilVerifier"
            ]
        ),
        .binaryTarget(
            name: "TinfoilVerifier",
            url:
                "https://github.com/germ-network/tinfoil-verifier/releases/download/0.0.9ffi/TinfoilVerifier.xcframework.zip",
            checksum: "b1d70b133fe0973384ff893e9971d3863087cc0fe06a56d00198bfff63885ae4"
        ),
        .testTarget(
            name: "TinfoilVerifierSwiftTests",
            dependencies: ["TinfoilVerifierSwift"]
        ),
    ])
