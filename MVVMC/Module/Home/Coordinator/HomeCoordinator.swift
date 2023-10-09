//
//  HomeCoordinator.swift
//  MVVMC
//
//  Created by sam on 2023/10/7.
//

import UIKit

final class HomeCoordinator: Coordinator {

    override var startViewController: UIViewController {
        let viewController = HomeViewController(HomeViewModel(HomeModel()))
        viewController.delegate = self
        return UINavigationController(rootViewController: viewController)
    }
}

extension HomeCoordinator: HomeViewControllerDelegate {
    
    func homeViewControllerDidSelectedLeftBarButtonItem(_ viewController: HomeViewController) {
        let router = ModalNavigationRouter(parentViewController: viewController)
        let coordinator = AccountCoordinator(router: router)
        startChild(coordinator)
    }
    
    func homeViewControllerDidSelectedRightBarButtonItem(_ viewController: HomeViewController) {
        let router = NavigationRouter(navigationController: viewController.navigationController!)
        let coordinator = SettingComponent(router: router)
        startChild(coordinator)
    }
}
