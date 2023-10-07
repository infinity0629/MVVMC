//
//  AppDelegateRouter.swift
//  MVVMC
//
//  Created by sam on 2023/10/7.
//

import UIKit

public class AppDelegateRouter: Router {
    
    public let window: UIWindow
    
    public init(window: UIWindow) {
        self.window = window
    }
    
    public func present(_ viewController: UIViewController, animated: Bool, onDismissed: (() -> Void)?) {
        window.rootViewController = viewController
        window.makeKeyAndVisible()
    }
    
    public func dismiss(animated: Bool) {
        
    }
}
