import PackageDescription

let package = Package(
    name: "SwiftCV",
    products: [
        .library(
            name: "SwiftCV",
            targets: ["SwiftCV"]),
    ],
    dependencies: [
        //
    ],
    targets: [
        .target(
            name: "SwiftCV",
            dependencies: ["COpenCV"]),
        .target(
            name: "COpenCV",
            dependencies: ["opencv4"]
        ),
        .systemLibrary(
            name: "opencv4",
            pkgConfig: "opencv4"
        )
    ]
)
