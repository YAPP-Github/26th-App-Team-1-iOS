// Copyright © 2025 Booket. All rights reserved

import Foundation

public protocol NetworkProvider {
    
    @discardableResult
    func request<T: Decodable>(
        target: RequestTarget,
        type: T.Type
    ) async throws -> T
    
    func makeURL(target: RequestTarget) throws -> URL?
}
