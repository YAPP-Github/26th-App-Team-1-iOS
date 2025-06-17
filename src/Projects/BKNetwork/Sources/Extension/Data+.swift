// Copyright © 2025 Booket. All rights reserved

import Foundation

extension Data {
    func decode<T: Decodable>(
        to type: T.Type,
        with response: URLResponse
    ) throws -> T {
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.invalidResponse
        }

        guard let decoded = try? JSONDecoder().decode(T.self, from: self) else {
            switch httpResponse.statusCode {
            case 401: throw NetworkError.unauthorized
            case 500...599: throw NetworkError.internalServerError
            default: throw NetworkError.invalidResponse
            }
        }

        return decoded
    }
}
