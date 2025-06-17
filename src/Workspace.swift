import ProjectDescription
import ProjectDescriptionHelpers

let workspace = Workspace(
    name: "Booket",
    projects: BKModule.allCases.map {
        .relativeToRoot("Projects/\($0.rawValue)")
    },
    fileHeaderTemplate: "Copyright © 2025 Booket. All rights reserved"
)
