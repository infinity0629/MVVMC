//
//  SettingComponent.swift
//  MVVMC
//
//  Created by sam on 2023/10/8.
//

import UIKit

class SettingComponent: Coordinator {

    var children: [Coordinator] = []
    
    let router: Router
    
    init(router: Router) {
        self.router = router
    }
    
    func start(animated: Bool, onEnded: (() -> Void)?) {
        let viewController = SettingViewController(SettingViewModel(SettingModel()))
        router.start(viewController, animated: animated, onEnded: onEnded)
    }
}
