// Copyright © 2025 Booket. All rights reserved

import BKData

public struct KeychainTokenProvider: TokenProvider {
    private let storage: KeyValueStorage
    
    public init(storage: KeyValueStorage) {
        self.storage = storage
    }
    
    private let accessTokenKey = "accessToken"
    private let refreshTokenKey = "refreshToken"
    
    public var accessToken: String? {
        try? storage.load(for: accessTokenKey)
    }
    
    public func refreshIfNeeded() async throws {
        // TODO: Refresh 기능 구현
    }
}
