// Copyright © 2025 Booket. All rights reserved

import Foundation
import BKData

public struct DefaultNetworkProvider: NetworkProvider {
    @discardableResult
    func request<T: Decodable>(
        target: RequestTarget,
        type: T.Type
    ) async throws -> T {
        
    }
    
    func makeURL(target: RequestTarget) throws -> URL? {
        
    }
}
