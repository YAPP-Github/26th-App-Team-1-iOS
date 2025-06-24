// Copyright © 2025 Booket. All rights reserved

import Foundation
import BKDomain
import Combine
import KakaoSDKCommon
import KakaoSDKAuth
import KakaoSDKUser

public final class KakaoLoginService: SocialLoginService {
    public var provider: BKDomain.AuthProvider
    private let kakaoAPI: kakaouser
    
    public init(provider: BKDomain.AuthProvider) {
        self.provider = provider
    }

    public func login() -> AnyPublisher<String, BKDomain.AuthError> {
        <#code#>
    }

    
}
