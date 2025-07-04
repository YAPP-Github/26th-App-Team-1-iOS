// Copyright © 2025 Booket. All rights reserved

import AuthenticationServices
import BKDomain
import Combine
import Foundation

public final class AppleLoginService: NSObject, SocialLoginService {
    public let provider: AuthProvider = .apple
    private let delegateProxy: AppleLoginDelegateProxy
    
    public override init() {
        self.delegateProxy = AppleLoginDelegateProxy()
        super.init()
    }
    
    public func login() -> AnyPublisher<String, AuthError> {
        delegateProxy.startAuthorization()
    }
}
