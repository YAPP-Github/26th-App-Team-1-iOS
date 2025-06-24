// Copyright © 2025 Booket. All rights reserved

import Combine
import Foundation

/// 온보딩 화면에서 소셜 로그인(또는 회원가입) 처리 전용 유즈케이스
public protocol SignInUseCase {
    /// SDK로부터 받은 소셜 토큰을 서버에 전달하여
    /// 로그인 또는 회원가입을 처리하고, 발급된 액세스·리프레시 토큰을 반환합니다.
    ///
    /// - Returns: 서버가 발급한 `AuthTokens`
    /// - Failure: `AuthError`
    func execute() -> AnyPublisher<AuthTokens, AuthError>
}
