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
        let navigationController = UINavigationController(rootViewController: viewController)
        router.start(navigationController, animated: animated, onEnded: onEnded)
    }
}
