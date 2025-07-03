// Copyright © 2025 Booket. All rights reserved

import UIKit

public extension UIApplication {
    var keyWindowInActiveScene: UIWindow? {
        connectedScenes
            .compactMap { $0 as? UIWindowScene }
            .first { $0.activationState == .foregroundActive }?
            .windows
            .first(where: \.isKeyWindow)
    }
}
