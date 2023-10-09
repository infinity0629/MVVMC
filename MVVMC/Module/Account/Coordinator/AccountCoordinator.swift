//
//  AccountCoordinator.swift
//  MVVMC
//
//  Created by sam on 2023/10/8.
//

import UIKit

final class AccountCoordinator: Coordinator {

    override var startViewController: UIViewController {
        let accountViewController = AccountViewController(AccountViewModel(AccountModel()))
        accountViewController.delegate = self
        return accountViewController
    }
}

extension AccountCoordinator: AccountViewControllerDelegate {
    
    func accountViewControllerGuideButtonPressed(_ viewController: AccountViewController) {
        let router = NavigationRouter(navigationController: viewController.navigationController!)
        let coordinator = GuideCoordinator(router: router)
        startChild(coordinator)
    }
}
