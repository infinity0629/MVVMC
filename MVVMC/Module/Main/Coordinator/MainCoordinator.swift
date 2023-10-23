//
//  MainCoordinator.swift
//  MVVMC
//
//  Created by sam on 2023/10/9.
//

import UIKit
import InfinityUIKit
import RxSwift

final class MainCoordinator: Coordinator {
    
    let disposeBag = DisposeBag()
    
    override var startViewController: UIViewController {
        
        // MARK: --- Home ---
        let homeViewController = HomeViewController(HomeViewModelImpl(HomeModel()))
        let homeNavigationController = UINavigationController(rootViewController: homeViewController)
        homeViewController.viewModel.accountSubject
            .subscribe(onNext: { [weak self] in
                guard let self else { return }
                let router = ModalNavigationRouter(parentViewController: homeViewController)
                let coordinator = AccountCoordinator(router: router)
                startChild(coordinator)
            })
            .disposed(by: disposeBag)
        homeViewController.viewModel.settingSubject
            .subscribe(onNext: { [weak self] in
                guard let self else { return }
                let router = NavigationRouter(navigationController: homeViewController.navigationController!)
                let coordinator = SettingComponent(router: router)
                startChild(coordinator)
            })
            .disposed(by: disposeBag)
        
        // MARK: --- Product ---
        let productViewController = ProductViewController(ProductViewModel(ProductModel()))
        let productNavigationController = UINavigationController(rootViewController: productViewController)
        
        // MARK: --- Account ---
        let accountViewController = AccountViewController(AccountViewModel(AccountModel()))
        accountViewController.delegate = self
        let accountNavigationController = UINavigationController(rootViewController: accountViewController)
        
        let mainViewController = MainViewController(MainViewModel(MainModel()))
        mainViewController.viewControllers = [homeNavigationController, productNavigationController, accountNavigationController]
        return mainViewController
    }
}

extension MainCoordinator: AccountViewControllerDelegate {
    
    func accountViewControllerGuideButtonPressed(_ viewController: AccountViewController) {
        let router = NavigationRouter(navigationController: viewController.navigationController!)
        let coordinator = GuideCoordinator(router: router)
        startChild(coordinator)
    }
}

