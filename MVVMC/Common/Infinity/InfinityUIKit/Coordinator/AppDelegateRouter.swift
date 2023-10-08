//
//  AppDelegateRouter.swift
//  MVVMC
//
//  Created by sam on 2023/10/7.
//

import UIKit

public class AppDelegateRouter {
    
    private let window: UIWindow
    
    public init(window: UIWindow) {
        self.window = window
    }
}

extension AppDelegateRouter: Router {
    
    public func start(_ viewController: UIViewController, animated: Bool, onEnded: (() -> Void)?) {
        window.rootViewController = viewController
        window.makeKeyAndVisible()
    }
    
    public func end(animated: Bool) {
        
    }
}
