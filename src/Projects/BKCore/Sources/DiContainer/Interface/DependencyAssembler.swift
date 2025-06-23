// Copyright © 2025 Booket. All rights reserved

public typealias DependencyContainerClosure = (DependencyResolver) -> Any

public protocol DependencyAssembler {
    func assemble(_ assemblies: [any Assembly])
    
    func register<T>(
        type: T.Type,
        name: String?,
        scope: ContainerScope,
        containerClosure: @escaping DependencyContainerClosure
    )
}
