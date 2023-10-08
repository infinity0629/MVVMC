//
//  HomeCoordinator.swift
//  MVVMC
//
//  Created by sam on 2023/10/7.
//

import UIKit

class HomeCoordinator: Coordinator {

    var children: [Coordinator] = []
    
    let router: Router
    
    init(router: Router) {
        self.router = router
    }
    
    func start(animated: Bool, onEnded: (() -> Void)?) {
        let viewController = HomeViewController(HomeViewModel(HomeModel()))
        viewController.delegate =  self
        let navigationController = UINavigationController(rootViewController: viewController)
        router.start(navigationController, animated: animated, onEnded: onEnded)
    }
}

extension HomeCoordinator: HomeViewControllerDelegate {
    
    func homeViewControllerDidSelectedLeftBarButtonItem(_ viewController: HomeViewController) {
        let router = ModalNavigationRouter(parentViewController: viewController)
        let coordinator = AccountCoordinator(router: router)
        coordinator.startChild(coordinator, animated: true, onEnded: nil)
    }
    
    func homeViewControllerDidSelectedRightBarButtonItem(_ viewController: HomeViewController) {
        let router = NavigationRouter(navigationController: viewController.navigationController!)
        let coordinator = SettingComponent(router: router)
        startChild(coordinator, animated: true, onEnded: nil)
    }
}
