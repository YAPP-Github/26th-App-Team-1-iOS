// Copyright © 2025 Booket. All rights reserved

import Combine
import Foundation

final class URLSessionRequestor: NetworkRequestable {
    private let session: URLSession

    init(session: URLSession = .shared) {
        self.session = session
    }

    func data(for request: URLRequest) -> AnyPublisher<(Data, URLResponse), Error> {
        session.dataTaskPublisher(for: request)
            .map { ($0.data, $0.response) }
            .mapError { $0 as Error }
            .eraseToAnyPublisher()
    }
}
