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
                "https://github.com/germ-network/tinfoil-verifier/releases/download/0.0.9ffi-v4/TinfoilVerifier.xcframework.zip",
            checksum: "72dddd0ade2e2a29660caaa1e05844614ad1a2c7110bc6b2559d5468e0ce2f7b"
        ),
        .testTarget(
            name: "TinfoilVerifierSwiftTests",
            dependencies: ["TinfoilVerifierSwift"]
        ),
    ])
