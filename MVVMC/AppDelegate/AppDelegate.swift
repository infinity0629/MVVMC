//
//  AppDelegate.swift
//  MVVMC
//
//  Created by sam on 2023/10/6.
//

import UIKit

@main
class AppDelegate: UIResponder  {
    
    enum RootCoordinator { case guide, main }
    
    static var shared = UIApplication.shared.delegate as! AppDelegate
    
    lazy var window: UIWindow? = UIWindow(frame: UIScreen.main.bounds)
    lazy var router = AppDelegateRouter(window: window!)
    lazy var mainCoordinator = MainCoordinator(router: router)
}

extension AppDelegate {
    
    func setCoordinator(_ type: RootCoordinator) {
        switch type {
        case .guide:
            GuideCoordinator(router: router).start()
        case .main:
            mainCoordinator.start()
        }
    }
}

extension AppDelegate: UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        setCoordinator(.main)
        
        return true
    }
}



