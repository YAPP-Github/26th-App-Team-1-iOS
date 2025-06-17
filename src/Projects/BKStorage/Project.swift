import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.project(
    name: BKModule.BKStorage.rawValue,
    targets: [
        Target.target(
            name: BKModule.BKStorage.rawValue,
            product: Project.product,
            bundleId: "storage." + Project.bundleID,
            sources: .sources,
            dependencies: [
                .core(),
            ]
        ),
        Target.target(
            name: "\(BKModule.BKStorage.rawValue)Test",
            product: .unitTests,
            bundleId: "storagetest" + Project.bundleID,
            sources: .tests,
            dependencies: [
                .storage()
            ]
        )
    ]
)
