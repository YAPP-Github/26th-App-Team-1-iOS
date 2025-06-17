import ProjectDescription
import ProjectDescriptionHelpers

let appTarget = Target.target(
    name: "Booket",
    product: .app,
    bundleId: Project.bundleID,
    infoPlist: .default,
//    infoPlist: .file(path: .relativeToRoot("src/SupportingFiles/Info.plist")),
    sources: .sources,
    resources: [
//        .glob(pattern: .relativeToRoot("src/Resources/**")),
//        .glob(pattern: .relativeToRoot("src/Resources/LaunchScreen.storyboard"))
    ],
//    entitlements: .file(path: .relativeToRoot("src/SupportingFiles/Booket.entitlements")),
    dependencies: [
        // Module
        .data(),
        .presentation(),
        .core(),
        .design(),
        .network(),
        .storage(),
        .domain()
    ],
    settings: .settings(
        base: [
            "DEVELOPMENT_LANGUAGE": "ko"
        ],
        configurations: [
            .debug(name: "Debug", xcconfig: "SupportingFiles/Debug.xcconfig"),
            .release(name: "Release", xcconfig: "SupportingFiles/Release.xcconfig")
        ]
    )
)

// MARK: - Project
let project = Project.project(
    name: "Booket",
    targets: [
        appTarget
    ]
)
