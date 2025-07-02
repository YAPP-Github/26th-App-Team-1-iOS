// Copyright © 2025 Booket. All rights reserved

import AuthenticationServices
import BKDomain
import Combine
import UIKit

final class AppleLoginDelegateProxy: NSObject {
    private let subject = PassthroughSubject<String, AuthError>()
}

extension AppleLoginDelegateProxy: ASAuthorizationControllerDelegate, ASAuthorizationControllerPresentationContextProviding {
    func startAuthorization() -> AnyPublisher<String, AuthError> {
        let request = ASAuthorizationAppleIDProvider().createRequest()
        request.requestedScopes = [.email, .fullName]

        let controller = ASAuthorizationController(authorizationRequests: [request])
        controller.delegate = self
        controller.presentationContextProvider = self
        controller.performRequests()

        return subject
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }

    func authorizationController(
        controller: ASAuthorizationController,
        didCompleteWithAuthorization authorization: ASAuthorization
    ) {
        guard let credential = authorization.credential as? ASAuthorizationAppleIDCredential,
              let tokenData = credential.identityToken,
              let token = String(data: tokenData, encoding: .utf8)
        else {
            subject.send(completion: .failure(.missingToken))
            return
        }

        subject.send(token)
        subject.send(completion: .finished)
    }

    func authorizationController(
        controller: ASAuthorizationController,
        didCompleteWithError error: Error
    ) {
        subject.send(completion: .failure(.sdkError(message: error.localizedDescription)))
    }

    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return UIApplication.shared.keyWindowInActiveScene ?? UIWindow()
    }
}
