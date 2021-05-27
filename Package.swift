// swift-tools-version:5.2
import PackageDescription

let package = Package(
    name: "WalletPassGenerator",
    platforms: [
        .macOS(.v10_15),
    ],
    products: [
        .library(
            name: "WalletPassGenerator",
            targets: ["WalletPassGenerator"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/weichsel/ZIPFoundation", from: "0.9.12"),
        .package(url: "https://github.com/JohnSundell/ShellOut.git", from: "2.0.0")
    ],
    targets: [
        .target(
            name: "WalletPassGenerator",
            dependencies: [
                .product(name: "ShellOut", package: "ShellOut"),
                .product(name: "ZIPFoundation", package: "ZIPFoundation")
            ]
        ),
        .target(
            name: "Run",
            dependencies: [
                .target(name: "WalletPassGenerator")
            ]
        ),
        .testTarget(
            name: "WalletPassGeneratorTests",
            dependencies: ["WalletPassGenerator"]
        ),
    ]
)
