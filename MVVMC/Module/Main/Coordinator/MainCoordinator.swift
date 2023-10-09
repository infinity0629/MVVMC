//
//  MainCoordinator.swift
//  MVVMC
//
//  Created by sam on 2023/10/9.
//

import UIKit

final class MainCoordinator: Coordinator {
    
    override var startViewController: UIViewController {
        
        let homeViewController = HomeViewController(HomeViewModel(HomeModel()))
        homeViewController.delegate = self
        let homeNavigationController = UINavigationController(rootViewController: homeViewController)
        
        let productViewController = ProductViewController(ProductViewModel(ProductModel()))
        let productNavigationController = UINavigationController(rootViewController: productViewController)
        
        let accountViewController = AccountViewController(AccountViewModel(AccountModel()))
        let accountNavigationController = UINavigationController(rootViewController: accountViewController)
        
        let mainViewController = MainViewController(MainViewModel(MainModel()))
        
        mainViewController.viewControllers = [homeNavigationController, productNavigationController, accountNavigationController]
        
        return mainViewController
    }
}

extension MainCoordinator: HomeViewControllerDelegate {
    
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
