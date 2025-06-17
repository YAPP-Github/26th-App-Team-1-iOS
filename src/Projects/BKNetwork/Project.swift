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
            dependencies: [
                .core(),
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
