// Copyright © 2025 Booket. All rights reserved

import BKData
import Foundation

public struct DefaultNetworkProvider: NetworkProvider {
    private let requestor: NetworkRequestable
    
    public init(requestor: NetworkRequestable) {
        self.requestor = requestor
    }
    
    @discardableResult
    public func request<T: Decodable>(
        target: RequestTarget,
        type: T.Type,
        isRetry: Bool = false
    ) async throws -> T {
        let request = try target.makeURLRequest()
        let (data, response) = try await requestor.data(for: request)
        return try data.decode(to: type, with: response)
    }
}
