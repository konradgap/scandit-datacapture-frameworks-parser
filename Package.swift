// swift-tools-version: 5.9
import PackageDescription

// Version is set during release process
// When developing locally in monorepo, the version is read from package.json/info.json
// When published to GitHub, the version must be hardcoded
let version = "7.6.1"

let package = Package(
    name: "scandit-datacapture-frameworks-parser",
    platforms: [.iOS(.v15)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "ScanditFrameworksParser",
            targets: ["ScanditFrameworksParser"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/Scandit/scandit-datacapture-frameworks-core.git", exact: Version(stringLiteral: version)),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "ScanditFrameworksParser",
            dependencies: [
                .product(name: "ScanditFrameworksCore", package: "scandit-datacapture-frameworks-core"),
                "ScanditParser"
            ]
        ),
        .binaryTarget(
            name: "ScanditParser",
            path: "Frameworks/ScanditParser.xcframework"
        ),
    ]
)
