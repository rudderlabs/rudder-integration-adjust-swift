// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "RudderAdjust",
    platforms: [
        .iOS("13.0"), .tvOS("11.0")
    ],
    products: [
        .library(
            name: "RudderAdjust",
            targets: ["RudderAdjust"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/adjust/ios_sdk", "4.29.7"..<"4.29.8"),
        .package(url: "https://github.com/rudderlabs/rudder-sdk-ios", from: "2.0.0"),
    ],
    targets: [
        .target(
            name: "RudderAdjust",
            dependencies: [
                .product(name: "Adjust", package: "ios_sdk"),
                .product(name: "Rudder", package: "rudder-sdk-ios"),
            ],
            path: "Sources",
            sources: ["Classes/"]
        )
    ]
)
