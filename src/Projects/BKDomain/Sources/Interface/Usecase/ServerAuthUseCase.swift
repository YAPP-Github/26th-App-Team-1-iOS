// Copyright © 2025 Booket. All rights reserved

import Combine
import Foundation

public protocol ServerAuthUseCase {
    func execute(socialResult: SocialLoginResult) -> AnyPublisher<AuthTokens, AuthError>
}

