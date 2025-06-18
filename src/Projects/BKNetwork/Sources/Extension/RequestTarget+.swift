// Copyright © 2025 Booket. All rights reserved

import BKData
import Foundation

extension RequestTarget {
    var query: [String: Any] {
        return [:]
    }
    
    func makeURLRequest(accessToken: String = "") throws -> URLRequest {
        var request: URLRequest = try URLRequest(baseURL + path, query: query)
        
        request.makeURLHeaders(headers)
        request.addAuthorization(accessToken)
        request.httpMethod = method.rawValue
        request.cachePolicy = .reloadIgnoringLocalCacheData
        
        if let body { request.setBody(body) }
        return request
    }
}
