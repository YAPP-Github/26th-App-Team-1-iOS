import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.project(
    name: BKModule.BKDesign.rawValue,
    targets: [
        Target.target(
            name: BKModule.BKDesign.rawValue,
            product: Project.product,
            bundleId: "design." + Project.bundleID,
            sources: .sources,
            resources: .default,
            dependencies: [
                .core(),
            ]
        ),
        Target.target(
            name: "\(BKModule.BKDesign.rawValue)Test",
            product: .unitTests,
            bundleId: "designtest" + Project.bundleID,
            sources: .tests,
            dependencies: [
                .design()
            ]
        )
    ]
)
