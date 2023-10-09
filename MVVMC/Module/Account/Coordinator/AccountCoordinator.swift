//
//  AccountCoordinator.swift
//  MVVMC
//
//  Created by sam on 2023/10/8.
//

import UIKit

final class AccountCoordinator: Coordinator {

    let router: Router
    var children: [Coordinator] = []
    
    init(router: Router) {
        self.router = router
    }
    
    func start(animated: Bool, onEnded: (() -> Void)?) {
        let viewController = AccountViewController(AccountViewModel(AccountModel()))
        router.start(viewController)
    }
}
