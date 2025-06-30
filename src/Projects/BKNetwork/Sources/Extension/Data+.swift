// Copyright © 2025 Booket. All rights reserved

import Foundation

extension Data {
    func decode<T: Decodable>(
        to type: T.Type
    ) throws -> T {
        return try JSONDecoder().decode(T.self, from: self)
    }
}
