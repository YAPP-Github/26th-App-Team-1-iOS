// Copyright © 2025 Booket. All rights reserved

import BKData
import Foundation

public struct OAuthNetworkProvider: NetworkProvider {
    private let requestor: NetworkRequestable
    private let interceptor: AuthInterceptor
    
    public init(requestor: NetworkRequestable, interceptor: AuthInterceptor) {
        self.requestor = requestor
        self.interceptor = interceptor
    }
    
    @discardableResult
    public func request<T: Decodable>(
        target: RequestTarget,
        type: T.Type,
        isRetry: Bool = false
    ) async throws -> T {
        let adaptedRequest = try interceptor.adapt(target.makeURLRequest())
        let (data, response) = try await requestor.data(for: adaptedRequest)
        
        if try await interceptor.retryIfNeeded(response, data), isRetry == false {
            return try await request(target: target, type: type, isRetry: true)
        }
        
        return try data.decode(to: type, with: response)
    }
}
