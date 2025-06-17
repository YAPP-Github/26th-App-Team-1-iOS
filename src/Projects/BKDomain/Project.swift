import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.project(
    name: BKModule.BKDomain.rawValue,
    targets: [
        Target.target(
            name: BKModule.BKDomain.rawValue,
            product: Project.product,
            bundleId: "domain." + Project.bundleID,
            sources: .sources,
            dependencies: [
                .core(),
            ]
        ),
        Target.target(
            name: "\(BKModule.BKDomain.rawValue)Test",
            product: .unitTests,
            bundleId: "domaintest" + Project.bundleID,
            sources: .tests,
            dependencies: [
                .domain()
            ]
        )
    ]
)
