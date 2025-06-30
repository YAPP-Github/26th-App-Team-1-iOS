// Copyright © 2025 Booket. All rights reserved

import Combine
import Foundation

public protocol NetworkRequestable {
    func data(for request: URLRequest) -> AnyPublisher<(Data, URLResponse), Error>
}

extension URLSession: NetworkRequestable {
    public func data(for request: URLRequest) -> AnyPublisher<(Data, URLResponse), Error> {
        self.dataTaskPublisher(for: request)
            .map { ($0.data, $0.response) }
            .mapError { $0 as Error }
            .eraseToAnyPublisher()
    }
}
