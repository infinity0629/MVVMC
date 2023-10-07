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
    
    public func present(_ viewController: UIViewController, animated: Bool, onDismissed: (() -> Void)?) {
        window.rootViewController = viewController
        window.makeKeyAndVisible()
    }
    
    public func dismiss(animated: Bool) {
        
    }
}
