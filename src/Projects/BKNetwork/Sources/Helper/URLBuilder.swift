// Copyright © 2025 Booket. All rights reserved

import BKData
import Foundation

public struct URLBuilder: URLBuilding {
    public func makeURL(target: RequestTarget) throws -> URL? {
        return try target.makeURLRequest().url
    }
}
