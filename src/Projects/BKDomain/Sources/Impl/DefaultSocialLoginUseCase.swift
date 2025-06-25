// Copyright © 2025 Booket. All rights reserved

import Combine
import Foundation

/// OAuth로 Token 발급하는 일만 함
/// 이거 kakao, apple인 경우에 어떻게 처리할지 좀 더 고민해봐야하지 않을까? Factory 같은걸로
public final class DefaultSocialLoginUseCase: SocialLoginUseCase {
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
