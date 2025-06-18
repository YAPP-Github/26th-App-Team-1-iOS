// Copyright © 2025 Booket. All rights reserved

public enum StorageError: Error {
    case writeError
    case readError
    case deleteError
    case decodeError
    case notFound
}
