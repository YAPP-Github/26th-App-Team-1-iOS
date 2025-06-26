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
    
    /// 카카오톡 앱 로그인 가능 여부를 반환
    func isLoginWithTalkAvailable() -> Bool
    
    /// 카카오톡 앱을 이용한 로그인
    func loginWithKakaoTalk(
        launchMethod: KakaoLaunchMethod?,
        channelPublicIds: [String]?,
        serviceTerms: [String]?,
        nonce: String?,
        completion: @escaping (KakaoAuthToken?, Error?) -> Void
    )
    
    /// 카카오 계정 로그인
    func loginWithKakaoAccount(
        prompts : [KakaoAuthPrompt]?,
        channelPublicIds: [String]?,
        serviceTerms: [String]?,
        nonce: String?,
        completion: @escaping (KakaoAuthToken?, Error?) -> Void
    )
}

extension UserApi: KakaoUserAPIProtocol {
    public func isLoginWithTalkAvailable() -> Bool {
        UserApi.isKakaoTalkLoginAvailable()
    }
}
