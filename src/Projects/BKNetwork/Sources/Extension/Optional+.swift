// Copyright © 2025 Booket. All rights reserved

import Foundation

extension Optional {
    func orThrow(
        _ error: @autoclosure () -> Error
    ) throws -> Wrapped {
        guard let value = self else { throw error() }
        return value
    }
}
