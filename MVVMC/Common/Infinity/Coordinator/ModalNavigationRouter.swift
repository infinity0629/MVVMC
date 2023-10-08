//
//  ModalNavigationRouter.swift
//  MVVMC
//
//  Created by sam on 2023/10/7.
//

import UIKit

public class ModalNavigationRouter: NSObject {

    private unowned let parentViewController: UIViewController
    private let navigationController = UINavigationController()
    private var onEndForViewControllers: [UIViewController: () -> Void] = [:]
    
    public init(parentViewController: UIViewController) {
        self.parentViewController = parentViewController
        super.init()
        navigationController.delegate = self
    }
}

extension ModalNavigationRouter: Router {
    
    public func start(_ viewController: UIViewController, animated: Bool, onEnded: (() -> Void)?) {
        onEndForViewControllers[viewController] = onEnded
        if navigationController.viewControllers.isEmpty {
            presentModally(viewController, animated: animated)
        } else {
            navigationController.pushViewController(viewController, animated: animated)
        }
    }
    
    public func end(animated: Bool) {
        performOnEnded(for: navigationController.viewControllers.first!)
        parentViewController.dismiss(animated: animated, completion: nil)
    }
}

extension ModalNavigationRouter: UINavigationControllerDelegate {

    public func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        guard let endedViewController = navigationController.transitionCoordinator?.viewController(forKey: .from), !navigationController.viewControllers.contains(endedViewController) else { return }
        performOnEnded(for: endedViewController)
    }
}

extension ModalNavigationRouter {
    
    private func presentModally(_ viewController: UIViewController, animated: Bool) {
        addCancelButton(to: viewController)
        navigationController.setViewControllers([viewController], animated: false)
        parentViewController.present(navigationController, animated: animated, completion: nil)
    }
    
    private func addCancelButton(to viewController: UIViewController) {
        if let _ = viewController.navigationItem.leftBarButtonItem {
            return
        }
        viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelPressed))
    }
    
    @objc private func cancelPressed() {
        end(animated: true)
    }
    
    private func performOnEnded(for viewController: UIViewController) {
        guard let onEnded = onEndForViewControllers[viewController] else { return }
        onEnded()
        onEndForViewControllers[viewController] = nil
    }
}
