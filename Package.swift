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
                "https://github.com/germ-network/tinfoil-verifier/releases/download/0.0.9ffi-v3/TinfoilVerifier.xcframework.zip",
            checksum: "746b1d41159a2297472def18fcc9926746597ef64cb72089b227cbcd94bf5464"
        ),
        .testTarget(
            name: "TinfoilVerifierSwiftTests",
            dependencies: ["TinfoilVerifierSwift"]
        ),
    ])
