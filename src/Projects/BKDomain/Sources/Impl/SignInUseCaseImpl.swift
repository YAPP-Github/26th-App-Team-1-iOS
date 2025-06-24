// Copyright © 2025 Booket. All rights reserved

import Combine
import Foundation

public final class SignInUseCaseImpl: SignInUseCase {
    private let loginService: SocialLoginService
    private let repository: AuthRepository
    
    public init(
      loginService: SocialLoginService,
      repository: AuthRepository
    ) {
      self.loginService = loginService
      self.repository   = repository
    }
    
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
