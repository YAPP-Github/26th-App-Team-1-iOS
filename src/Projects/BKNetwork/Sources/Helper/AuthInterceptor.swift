// Copyright © 2025 Booket. All rights reserved

import BKData
import Foundation

public struct AuthInterceptor {
    private let tokenProvider: TokenProvider
    
    public init(tokenProvider: TokenProvider) {
        self.tokenProvider = tokenProvider
    }
    
    func adapt(_ request: URLRequest) throws -> URLRequest {
        guard let token = tokenProvider.accessToken else { return request }
        
        var adapted = request
        adapted.addAuthorization(token)
        return adapted
    }
    
    func retryIfNeeded(_ response: URLResponse?, _ data: Data) async throws -> Bool {
        guard let httpResponse = response as? HTTPURLResponse else { return false }
        if httpResponse.statusCode == 401 {
            try await tokenProvider.refreshIfNeeded()
            return true
        }
        return false
    }
}
