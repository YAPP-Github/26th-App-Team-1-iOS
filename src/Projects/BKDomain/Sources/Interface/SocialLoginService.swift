// Copyright © 2025 Booket. All rights reserved

import Combine
import Foundation

public protocol SocialLoginService {
    var provider: AuthProvider { get }
    
    func login() -> AnyPublisher<String, AuthError>   // 소셜 토큰만 방출
}
