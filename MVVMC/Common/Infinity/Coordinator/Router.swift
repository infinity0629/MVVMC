//
//  Router.swift
//  MVVMC
//
//  Created by sam on 2023/10/7.
//

import UIKit

public protocol Router: AnyObject {
    
    func start(_ viewController: UIViewController, animated: Bool, onEnded: (() -> Void)?)
    func end(animated: Bool)
}

extension Router {
    
    public func start(_ viewController: UIViewController, animated: Bool) {
        start(viewController, animated: animated, onEnded: nil)
    }
    
    public func start(_ viewController: UIViewController, onEnded: (() -> Void)?) {
        start(viewController, animated: true, onEnded: onEnded)
    }
    
    public func start(_ viewController: UIViewController) {
        start(viewController, animated: true, onEnded: nil)
    }
}
