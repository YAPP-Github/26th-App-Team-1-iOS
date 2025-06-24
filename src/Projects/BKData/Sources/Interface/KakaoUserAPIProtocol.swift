// Copyright © 2025 Booket. All rights reserved

import Foundation
import KakaoSDKAuth
import KakaoSDKCommon
import KakaoSDKUser

public protocol KakaoUserAPIProtocol {
    typealias KakaoAuthToken = OAuthToken
    typealias KakaoLaunchMethod = LaunchMethod
    typealias KakaoAuthPrompt = Prompt
    typealias KakaoAuthError = SdkError
    
    func loginWithKakaoTalk(
        launchMethod: KakaoLaunchMethod?,
        channelPublicIds: [String]?,
        serviceTerms: [String]?,
        nonce: String?,
        completion: @escaping (KakaoAuthToken?, Error?) -> Void
    )
    
    func loginWithKakaoAccount(
        prompts : [KakaoAuthPrompt]?,
        channelPublicIds: [String]?,
        serviceTerms: [String]?,
        nonce: String?,
        completion: @escaping (KakaoAuthToken?, Error?) -> Void
    )
}

extension UserApi: KakaoUserAPIProtocol { }
