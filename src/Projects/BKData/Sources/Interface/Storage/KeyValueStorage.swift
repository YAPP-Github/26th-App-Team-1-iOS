// Copyright © 2025 Booket. All rights reserved

public protocol KeyValueStorage {
  func save<T: Encodable>(_ data: T, for account: String) throws
  func load<T: Decodable>(for account: String) throws -> T
  func delete(for account: String) throws
}
