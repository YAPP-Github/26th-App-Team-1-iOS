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
                .data()
            ]
        ),
        Target.target(
            name: "\(BKModule.BKNetwork.rawValue)Test",
            product: .unitTests,
            bundleId: "networktest" + Project.bundleID,
            sources: .tests,
            dependencies: [
                .network(),
                .external(dependency: .Nimble),
                .external(dependency: .Quick)
            ]
        )
    ]
)
