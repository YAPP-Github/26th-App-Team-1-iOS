// Copyright © 2025 Booket. All rights reserved

import Foundation

public protocol NetworkRequestable {
    func data(for request: URLRequest) async throws -> (Data, URLResponse)
}
