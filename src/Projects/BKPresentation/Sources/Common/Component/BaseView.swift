// Copyright © 2025 Booket. All rights reserved

import UIKit

class BaseView: UIView {
    // MARK: - Initialize
    override init(frame: CGRect) {
        super.init(frame: .zero)
        self.setupView()
        self.setupLayout()
        self.configure()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Common Methods
    func setupView() {}
    func setupLayout() {}
    func configure() {}
}
