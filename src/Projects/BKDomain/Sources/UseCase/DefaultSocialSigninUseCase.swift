// Copyright © 2025 Booket. All rights reserved

import Combine
import Foundation

public struct DefaultSocialSigninUseCase: SocialLoginUseCase {
    private let loginService: SocialLoginService
    
    public init(loginService: SocialLoginService) {
        self.loginService = loginService
    }
    
    public func execute() -> AnyPublisher<SocialLoginResult, AuthError> {
        loginService.login()
            .map { token in
                SocialLoginResult(
                    provider: self.loginService.provider,
                    token: token
                )
            }
            .eraseToAnyPublisher()
    }
}
