// swift-tools-version:5.0
import PackageDescription

let package = Package(
    name: "SwiftSox",
    products: [ .library( name: "SwiftSox", targets: ["SwiftSox"] ), ],
    targets: [
        .target( name: "SwiftSox", dependencies: ["sox"], path: "./Sources/SwiftSox" ),
        .testTarget( name: "SwiftSoxTests", dependencies: ["SwiftSox"], path: "./Tests"),
        .systemLibrary( name: "sox", pkgConfig: "sox" )
    ]
)
