//
//  AppDelegate.swift
//  MVVMC
//
//  Created by sam on 2023/10/6.
//

import UIKit

@main
class AppDelegate: UIResponder  {
    
    enum RootType { case guide, main }
    
    static var shared = UIApplication.shared.delegate as! AppDelegate
    
    lazy var window: UIWindow? = UIWindow(frame: UIScreen.main.bounds)
    lazy var router = AppDelegateRouter(window: window!)
    lazy var mainCoordinator = MainCoordinator(router: router)
    
    var coordinator: Coordinator!
}

extension AppDelegate {
    
    func setRootViewController(_ type: RootType) {
        switch type {
        case .guide:
            coordinator = GuideCoordinator(router: router)
        case .main:
            coordinator = mainCoordinator
        }
        coordinator.start()
    }
}

extension AppDelegate: UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        setRootViewController(.main)
        
        return true
    }
}



