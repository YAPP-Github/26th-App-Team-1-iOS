import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.project(
    name: BKModule.BKNetwork.rawValue,
    targets: [
        Target.target(
            name: BKModule.BKNetwork.rawValue,
            product: Project.product,
            bundleId: "network." + Project.bundleID,
            sources: .sources,
            scripts: [
                swiftLintScript
            ],
            dependencies: [
                .core(),
                .external(dependency: .KakaoSDKCommon),
                .external(dependency: .KakaoSDKAuth),
                .external(dependency: .KakaoSDKUser),
            ]
        ),
        Target.target(
            name: "\(BKModule.BKNetwork.rawValue)Test",
            product: .unitTests,
            bundleId: "networktest" + Project.bundleID,
            sources: .tests,
            dependencies: [
                .network()
            ]
        )
    ]
)
