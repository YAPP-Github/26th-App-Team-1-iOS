// Copyright © 2025 Booket. All rights reserved

import Combine
import Foundation

/// 서버와의 인증 관련 API 호출을 추상화한 레포지토리 프로토콜
public protocol AuthRepository {
    /// 지정된 소셜 로그인 공급자와 토큰을 이용해 서버에 로그인 또는 회원가입 요청을 보냅니다.
    ///
    /// - Parameters:
    ///   - provider: 사용할 소셜 로그인 공급자(`AuthProvider`)
    ///   - token: 소셜 SDK로부터 전달받은 인증 토큰(String)
    /// - Returns: 서버가 발급한 `AuthTokens`를 담은 퍼블리셔
    /// - Failure: `AuthError` 유형의 에러
    func signIn(
        provider: AuthProvider,
        token: String
    ) -> AnyPublisher<AuthTokens, AuthError>
    
    /// 서버에 로그아웃 요청을 보냅니다.
    ///
    /// - Returns: 정상 처리 시 빈 값(Void)을 방출하는 퍼블리셔
    /// - Failure: `AuthError` 유형의 에러
    func signOut() -> AnyPublisher<Void, AuthError>
    
    /// 지정된 소셜 로그인 공급자 및 토큰을 이용해 서버에 회원 탈퇴 요청을 보냅니다.
    ///
    /// - Parameters:
    ///   - provider: 사용할 소셜 로그인 공급자(`AuthProvider`)
    ///   - token: 탈퇴 처리에 필요한 소셜 인증 토큰(String?) (authorizationToken 등)
    /// - Returns: 정상 처리 시 빈 값(Void)을 방출하는 퍼블리셔
    /// - Failure: `AuthError` 유형의 에러
    func deleteAccount(
        provider: AuthProvider,
        token: String?
    ) -> AnyPublisher<Void, AuthError>
}
