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
    private var onEndForViewControllers: [UIViewController: () -> Void] = [:]
    
    public init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        routerRootController = navigationController.viewControllers.first
        super.init()
        navigationController.delegate = self
    }
}

extension NavigationRouter: Router {
    
    public func start(_ viewController: UIViewController, animated: Bool, onEnded: (() -> Void)?) {
        onEndForViewControllers[viewController] = onEnded
        navigationController.pushViewController(viewController, animated: animated)
    }
    
    public func end(animated: Bool) {
        guard let routerRootController else {
            navigationController.popToRootViewController(animated: animated)
            return
        }
        performOnEnded(for: routerRootController)
        navigationController.popToViewController(routerRootController, animated: animated)
    }
}

extension NavigationRouter: UINavigationControllerDelegate {

    public func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        guard let endedViewController = navigationController.transitionCoordinator?.viewController(forKey: .from), !navigationController.viewControllers.contains(endedViewController) else { return }
        performOnEnded(for: endedViewController)
    }
}

extension NavigationRouter {
    
    private func performOnEnded(for viewController: UIViewController) {
        guard let onEnded = onEndForViewControllers[viewController] else { return }
        onEnded()
        onEndForViewControllers[viewController] = nil
    }
}
