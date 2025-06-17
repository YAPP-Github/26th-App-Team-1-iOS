// Copyright © 2025 Booket. All rights reserved

import BKData
import Foundation

public protocol NetworkRequestable {
    func data(for request: URLRequest) async throws -> (Data, URLResponse)
}

public struct DefaultNetworkProvider: NetworkProvider {
    private let requestor: NetworkRequestable
    
    init(requestor: NetworkRequestable) {
        self.requestor = requestor
    }
    
    @discardableResult
    public func request<T: Decodable>(
        target: RequestTarget,
        type: T.Type
    ) async throws -> T {
        let request = try target.makeURLRequest()
        let (data, response) = try await requestor.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.invalidResponse
        }
        
        guard let responseDTO = try? JSONDecoder().decode(T.self, from: data) else {
            switch httpResponse.statusCode {
            case 401: throw NetworkError.unauthorized
            case 500...599: throw NetworkError.internalServerError
            default: throw NetworkError.invalidResponse
            }
        }
        
        return responseDTO
    }
}
