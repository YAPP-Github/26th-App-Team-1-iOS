// Copyright © 2025 Booket. All rights reserved

public protocol DependencyResolver {
    func resolve<T>(
        type: T.Type,
        name: String?
    ) -> T?
    
    func resolveOrFatal<T>(
        type: T.Type,
        name: String?
    ) -> T
}
