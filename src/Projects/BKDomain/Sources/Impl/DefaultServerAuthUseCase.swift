// Copyright © 2025 Booket. All rights reserved

import Combine
import Foundation

/// 생성된 토큰 기반으로 서버 통신해서 진짜 AuthTokens 발급
public final class DefaultServerAuthUseCase: ServerAuthUseCase {
    
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
