// Copyright © 2025 Booket. All rights reserved

import Combine
import Foundation

/// OAuth Provider를 통해 얻은 토큰을 백엔드에게 전송
/// 백엔드는 이를 처리하여 회원가입 또는 로그인 처리 이후 AccessToken 발급
public struct DefaultAuthenticationWithSocialTokenUseCase: AuthenticationWithSocialTokenUseCase {
    private let repository: AuthRepository
    
    public init(repository: AuthRepository) {
        self.repository = repository
    }
    
    public func execute(socialResult: SocialLoginResult) -> AnyPublisher<AuthTokens, AuthError> {
        repository.signIn(
            provider: socialResult.provider,
            token: socialResult.token
        )
    }

}
