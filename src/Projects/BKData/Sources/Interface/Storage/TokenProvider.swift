// Copyright © 2025 Booket. All rights reserved

public protocol TokenProvider {
    var accessToken: String? { get }
    func refreshIfNeeded() async throws
}
