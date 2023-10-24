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
