// Copyright © 2025 Booket. All rights reserved

public protocol NetworkProvider {
    @discardableResult
    func request<T: Decodable>(
        target: RequestTarget,
        type: T.Type,
        isRetry: Bool
    ) async throws -> T
}
