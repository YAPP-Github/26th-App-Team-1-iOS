import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.project(
    name: BKModule.BKCore.rawValue,
    targets: [
        Target.target(
            name: BKModule.BKCore.rawValue,
            product: Project.product,
            bundleId: "core." + Project.bundleID,
            sources: .sources,
            dependencies: [
            ]
        ),
        Target.target(
            name: "\(BKModule.BKCore.rawValue)Test",
            product: .unitTests,
            bundleId: "coretest" + Project.bundleID,
            sources: .tests,
            dependencies: [
                .core()
            ]
        )
    ]
)
