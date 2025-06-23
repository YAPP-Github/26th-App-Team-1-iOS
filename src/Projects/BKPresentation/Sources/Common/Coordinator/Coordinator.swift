// Copyright © 2025 Booket. All rights reserved

import UIKit

protocol Coordinator: AnyObject {
    // MARK: - Properties
    var parentCoordinator: (any Coordinator)? { get set }
    var childCoordinators: [any Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    // MARK: - Methods
    func start()
}

// MARK: - Default Implementation
extension Coordinator {
    func didFinish() {
        finishAllChildCoordinators()
        parentCoordinator?.removeChildCoordinator(self)
        
        if let self = self as? FinishNotifying {
            self.onFinish?()
        }
    }
    
    func popAndFinish(
        animated: Bool = true
    ) {
        guard navigationController.viewControllers.count > 1 else {
            didFinish()
            return
        }
        navigationController.popViewController(animated: animated)
        didFinish()
    }
    
    func addChildCoordinator(
        _ coordinator: any Coordinator
    ) {
        childCoordinators.append(coordinator)
        coordinator.parentCoordinator = self
    }
    
    func removeChildCoordinator(
        _ child: (any Coordinator)?
    ) {
        for (idx, coordinator) in childCoordinators.enumerated() where coordinator === child {
            childCoordinators.remove(at: idx)
            break
        }
    }
    
    func finishAllChildCoordinators() {
        for coordinator in childCoordinators {
            coordinator.finishAllChildCoordinators()
        }
        childCoordinators.removeAll()
    }
}
