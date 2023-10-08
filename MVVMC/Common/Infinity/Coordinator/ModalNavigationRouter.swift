//
//  ModalNavigationRouter.swift
//  MVVMC
//
//  Created by sam on 2023/10/7.
//

import UIKit
import RxSwift
import RxCocoa

public final class ModalNavigationRouter {

    private unowned let parentViewController: UIViewController
    private let navigationController = UINavigationController()
    private var onEndForViewControllers: [UIViewController: () -> Void] = [:]
    private let disposeBag =  DisposeBag()
    
    public init(parentViewController: UIViewController) {
        self.parentViewController = parentViewController
        navigationController.rx.didShow.subscribe { [weak self] (viewController, animated) in
            guard let self else { return }
            guard let endedViewController = navigationController.transitionCoordinator?.viewController(forKey: .from), !navigationController.viewControllers.contains(endedViewController) else { return }
            performOnEnded(for: endedViewController)
        }.disposed(by: disposeBag)
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

extension ModalNavigationRouter {
    
    private func presentModally(_ viewController: UIViewController, animated: Bool) {
        addDefaultCancelButton(to: viewController)
        navigationController.setViewControllers([viewController], animated: false)
        parentViewController.present(navigationController, animated: animated, completion: nil)
    }
    
    private func addDefaultCancelButton(to viewController: UIViewController) {
        if let _ = viewController.navigationItem.leftBarButtonItem {
            return
        }
        let leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: nil, action: nil)
        leftBarButtonItem.rx.tap.subscribe(onNext: { [weak self] in
            guard let self else { return }
            end(animated: true)
        }).disposed(by: disposeBag)
        viewController.navigationItem.leftBarButtonItem = leftBarButtonItem
    }
    
    private func performOnEnded(for viewController: UIViewController) {
        guard let onEnded = onEndForViewControllers[viewController] else { return }
        onEnded()
        onEndForViewControllers[viewController] = nil
    }
}
