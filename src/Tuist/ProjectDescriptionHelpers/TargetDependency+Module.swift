import ProjectDescription

// MARK: Core
extension TargetDependency {
    public static func core()-> TargetDependency {
        .project(target: "BKCore", path: .relativeToRoot("Projects/BKCore"))
    }
}

// MARK: DesignSystem
extension TargetDependency {
    public static func design()-> TargetDependency {
        .project(target: "BKDesign", path: .relativeToRoot("Projects/BKDesign"))
    }
}

// MARK: Network
extension TargetDependency {
    public static func network()-> TargetDependency {
        .project(target: "BKNetwork", path: .relativeToRoot("Projects/BKNetwork"))
    }
}

// MARK: Storage
extension TargetDependency {
    public static func storage()-> TargetDependency {
        .project(target: "BKStorage", path: .relativeToRoot("Projects/BKStorage"))
    }
}

// MARK: Data
extension TargetDependency {
    public static func data()-> TargetDependency {
        .project(target: "BKData", path: .relativeToRoot("Projects/BKData"))
    }
}


// MARK: Domain
extension TargetDependency {
    public static func domain()-> TargetDependency {
        .project(target: "BKDomain", path: .relativeToRoot("Projects/BKDomain"))
    }
}

// MARK: Presentation
extension TargetDependency {
    public static func presentation()-> TargetDependency {
        .project(target: "BKPresentation", path: .relativeToRoot("Projects/BKPresentation"))
    }
}
