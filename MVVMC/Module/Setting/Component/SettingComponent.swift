//
//  SettingComponent.swift
//  MVVMC
//
//  Created by sam on 2023/10/8.
//

import UIKit

final class SettingComponent: Coordinator {

    let router: Router
    var children: [Coordinator] = []
    
    init(router: Router) {
        self.router = router
    }
    
    func start(animated: Bool, onEnded: (() -> Void)?) {
        let viewController = SettingViewController(SettingViewModel(SettingModel()))
        router.start(viewController, onEnded: onEnded)
    }
}
