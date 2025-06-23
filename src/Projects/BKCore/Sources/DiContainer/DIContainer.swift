// Copyright © 2025 Booket. All rights reserved

typealias DependencyInjectable = DependencyResolver & DependencyAssembler

public final class DIContainer: DependencyInjectable {
    // MARK: - Properties
    public static let shared = DIContainer()
    
    private var services: [String: DependencyContainerClosure] = [:]
    private var instances: [String: Any] = [:]
    private var resolving: Set<String> = []
    
    // MARK: - Methods
    /// SceneDelegate에서 사용합니다. 자세한 설명은 Assembly의 Docc을 참고해주세요.
    public func assemble(_ assemblies: [any Assembly]) {
        assemblies.forEach { $0.assemble(container: self) }
    }
    
    /// 여러 스레드에서 `register(_:)`가 실행되면 공유 자원에 대한 문제가 발생할 수 있습니다.
    /// 즉, `register(_:)`는 thread-safe 하지 않은 메소드입니다. 사용시 주의 바랍니다.
    public func register<T>(
        type: T.Type,
        name: String? = nil,
        scope: ContainerScope = .transient,
        containerClosure: @escaping DependencyContainerClosure
    ) {
        let key = "\(name ?? "default")_\(type)"
        services[key] = { container in
            switch scope {
            case .transient:
                return containerClosure(container)
            case .singleton:
                if let existingInstance = self.instances[key] {
                    return existingInstance
                } else {
                    let instances = containerClosure(container)
                    self.instances[key] = instances
                    return instances
                }
            }
        }
    }
    
    public func resolve<T>(
        type: T.Type,
        name: String? = nil
    ) -> T? {
        let key = "\(name ?? "default")_\(type)"
        if resolving.contains(key) {
            fatalError("\(#file) - \(#line): \(#function) - \(type) circular dependency detected")
        }
        
        resolving.insert(key)
        defer { resolving.remove(key) }
        
        guard let service = services[key]?(self) as? T else { return nil }
        return service
    }
    
    public func resolveOrFatal<T>(
        type: T.Type,
        name: String?
    ) -> T {
        guard let resolved = DIContainer.shared.resolve(type: T.self) else {
            fatalError("\(#file) - \(#line): \(#function) - resolved failed for \(T.self)")
        }
        return resolved
    }
}
