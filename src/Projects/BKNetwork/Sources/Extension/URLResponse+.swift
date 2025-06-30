// Copyright © 2025 Booket. All rights reserved

import Foundation

extension URLResponse {
    var asHTTP: HTTPURLResponse? {
        self as? HTTPURLResponse
    }
}
