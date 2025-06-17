// Copyright © 2025 Booket. All rights reserved

public protocol RequestTarget {
    var baseURL: String { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var headers: [String: String] { get }
    var body: Encodable? { get }
    var query: [String: Any] { get }
}
