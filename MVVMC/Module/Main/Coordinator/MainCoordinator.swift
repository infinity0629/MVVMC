//
//  MainCoordinator.swift
//  MVVMC
//
//  Created by sam on 2023/10/9.
//

import UIKit
import RxSwift

final class MainCoordinator: Coordinator {
    
    override var startViewController: UIViewController {
        mainViewController
    }
    
    private lazy var mainViewController: MainViewController = {
        // MARK: --- Home ---
        let homeViewController = HomeViewController(HomeViewModelImpl(HomeModelImpl()))
        let homeNavigationController = UINavigationController(rootViewController: homeViewController)
        homeViewController.viewModel.accountSubject
            .subscribe(onNext: { [weak self] in
                guard let self else { return }
                let router = ModalNavigationRouter(parentViewController: homeViewController)
                let coordinator = LoginCoordinator(router: router)
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
        let productViewController = ProductTableViewController(ProductViewModelImpl())
        productViewController.title = "Product"
        let productNavigationController = UINavigationController(rootViewController: productViewController)
        
        // MARK: --- Account ---
        let accountViewController = AccountViewController(AccountViewModel(AccountModel()))
        let accountNavigationController = UINavigationController(rootViewController: accountViewController)
        accountViewController.viewModel.guideSubject
            .subscribe(onNext:  {
                AppDelegate.shared.setCoordinator(.guide)
            })
            .disposed(by: disposeBag)
        
        let mainViewController = MainViewController(MainViewModelImpl(MainModelImpl())).then {
            $0.childController.viewControllers =  [homeNavigationController, productNavigationController, accountNavigationController]
        }
        return mainViewController
    }()
}
