// Copyright © 2025 Booket. All rights reserved

import Foundation

extension HTTPURLResponse {
    func validate() throws {
        switch statusCode {
        case 200...299:
            return
        case 401:
            throw NetworkError.unauthorized
        case 500...599:
            throw NetworkError.internalServerError
        default:
            throw NetworkError.invalidResponse
        }
    }
}
