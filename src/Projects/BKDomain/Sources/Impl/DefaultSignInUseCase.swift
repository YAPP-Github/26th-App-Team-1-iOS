// Copyright © 2025 Booket. All rights reserved

import Combine
import Foundation

/// 토큰 발급 + 서버 통신을 하나의 Usecase에서 처리함
/// 
/// 소셜 로그인 서비스와 인증 리포지토리를 조합하여
/// 실제 로그인 비즈니스 로직(액세스·리프레시 토큰 발급)을 수행하는 UseCase 구현체
public final class DefaultSignInUseCase: SignInUseCase {
    /// SDK 로그인 또는 소셜 로그인 토큰 획득 로직을 제공하는 서비스
    private let loginService: SocialLoginService
    
    /// 서버에 소셜 토큰을 전달하여 최종 토큰(AuthTokens)을 발급받는 레포지토리
    private let repository: AuthRepository
    
    /// - Parameters:
    ///   - loginService: 소셜 SDK 로그인 과정을 추상화한 서비스
    ///   - repository: 서버 인증 API 호출을 추상화한 레포지토리
    public init(
        loginService: SocialLoginService,
        repository: AuthRepository
    ) {
        self.loginService = loginService
        self.repository   = repository
    }
    
    /// 로그인 비즈니스 로직 실행
    ///
    /// 1. `loginService`를 통해 소셜 SDK 로그인 또는 계정 로그인을 수행하여 소셜 토큰을 획득
    /// 2. 획득한 토큰을 `repository.signIn(provider:token:)`에 전달하여
    ///    서버에서 액세스·리프레시 토큰을 발급받아 반환
    ///
    /// - Returns: 서버가 발급한 `AuthTokens`를 방출하는 퍼블리셔
    /// - Failure: 로그인 과정 또는 서버 호출 중 발생한 `AuthError`
    public func execute() -> AnyPublisher<AuthTokens, AuthError> {
        loginService.login()
            .flatMap { token in
                self.repository.signIn(
                    provider: self.loginService.provider,
                    token: token
                )
            }
            .eraseToAnyPublisher()
    }
    
}
