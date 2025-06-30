// Copyright © 2025 Booket. All rights reserved

import BKData
import Combine
import Foundation

public struct DefaultNetworkProvider: NetworkProvider {
    private let requestor: NetworkRequestable
    
    public init(requestor: NetworkRequestable) {
        self.requestor = requestor
    }
    
    @discardableResult
    public func request<T: Decodable>(
        target: RequestTarget,
        type: T.Type
    ) -> AnyPublisher<T, Error> {
        do {
            let request = try target.makeURLRequest()
            return requestor.data(for: request)
                .tryMap { data, response in
                    try response.asHTTP
                        .orThrow(NetworkError.invalidResponse)
                        .validate()
                    return try data.decode(to: type)
                }
                .eraseToAnyPublisher()
        } catch {
            return Fail(error: error)
                .eraseToAnyPublisher()
        }
    }
}
