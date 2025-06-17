// Copyright © 2025 Booket. All rights reserved

import Foundation

public protocol URLBuilding {
    func makeURL(target: RequestTarget) throws -> URL?
}
