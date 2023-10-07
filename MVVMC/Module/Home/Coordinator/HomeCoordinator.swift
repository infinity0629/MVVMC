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
    
    func present(animated: Bool, onDismissed: (() -> Void)?) {
        let viewController = HomeViewController(HomeViewModel(HomeModel()))
        let navigationController = UINavigationController(rootViewController: viewController)
        router.present(navigationController,
                       animated: animated,
                       onDismissed: onDismissed)
    }
}
