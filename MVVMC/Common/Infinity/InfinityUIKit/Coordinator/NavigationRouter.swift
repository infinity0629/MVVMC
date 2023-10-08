//
//  NavigationRouter.swift
//  MVVMC
//
//  Created by sam on 2023/10/7.
//

import UIKit

public class NavigationRouter: NSObject {
    
    private let navigationController: UINavigationController
    private let routerRootController: UIViewController?
    private var onDismissForViewController: [UIViewController: () -> Void] = [:]
    
    public init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        routerRootController = navigationController.viewControllers.first
        super.init()
        navigationController.delegate = self
    }
}

extension NavigationRouter: Router {
    
    public func start(_ viewController: UIViewController, animated: Bool, onEnded: (() -> Void)?) {
        onDismissForViewController[viewController] = onEnded
        navigationController.pushViewController(viewController, animated: animated)
    }
    
    public func end(animated: Bool) {
        guard let routerRootController else {
            navigationController.popToRootViewController(animated: animated)
            return
        }
        performOnDismissed(for: routerRootController)
        navigationController.popToViewController(routerRootController, animated: animated)
    }
    
    private func performOnDismissed(for viewController: UIViewController) {
        guard let onDismiss = onDismissForViewController[viewController] else {
            return
        }
        onDismiss()
        onDismissForViewController[viewController] = nil
    }
}

extension NavigationRouter: UINavigationControllerDelegate {

    public func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        guard let dismissedViewController = navigationController.transitionCoordinator?.viewController(forKey: .from),
                !navigationController.viewControllers.contains(dismissedViewController) else {
            return
        }
        performOnDismissed(for: dismissedViewController)
    }
}
