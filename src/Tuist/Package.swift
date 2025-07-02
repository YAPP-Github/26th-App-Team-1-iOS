// swift-tools-version: 6.0
@preconcurrency import PackageDescription

#if TUIST
    import struct ProjectDescription.PackageSettings

    let packageSettings = PackageSettings(
        // Customize the product types for specific package product
        // Default is .staticFramework
        // productTypes: ["Alamofire": .framework,]
        productTypes: ["KakaoSDK": .staticLibrary,
                       "Nimble": .framework,
                       "Quick": .framework
                      ]
    )
#endif

let package = Package(
    name: "src",
    dependencies: [
        .package(url: "https://github.com/kakao/kakao-ios-sdk", from: "2.23.0"),
        .package(url: "https://github.com/Quick/Nimble.git", from: "13.7.1"),
        .package(url: "https://github.com/Quick/Quick.git", from: "7.6.2")
        // Add your own dependencies here:
        // .package(url: "https://github.com/Alamofire/Alamofire", from: "5.0.0"),
        // You can read more about dependencies here: https://docs.tuist.io/documentation/tuist/dependencies
    ]
)
