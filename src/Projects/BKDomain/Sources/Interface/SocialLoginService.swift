// Copyright © 2025 Booket. All rights reserved

import Combine
import Foundation

public protocol SocialLoginService: NSObject {
    var provider: AuthProvider { get }
    
    func login() -> AnyPublisher<String, AuthError>
}
