//
//  AppDelegate.swift
//  MVVMC
//
//  Created by sam on 2023/10/6.
//

import UIKit

@main
class AppDelegate: UIResponder  {
    
    static var shared = UIApplication.shared.delegate as! AppDelegate
    
    lazy var window: UIWindow? = UIWindow(frame: UIScreen.main.bounds)
    lazy var router = AppDelegateRouter(window: window!)
    lazy var coordinator = HomeCoordinator(router: router)
}

extension AppDelegate: UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        coordinator.present(animated: true)
        
        return true
    }
}
