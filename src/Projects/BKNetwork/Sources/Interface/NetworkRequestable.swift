// Copyright © 2025 Booket. All rights reserved

import Combine
import Foundation

public protocol NetworkRequestable {
    func data(for request: URLRequest) -> AnyPublisher<(Data, URLResponse), Error>
}
