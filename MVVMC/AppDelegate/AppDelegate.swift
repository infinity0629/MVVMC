//
//  AppDelegate.swift
//  MVVMC
//
//  Created by sam on 2023/10/6.
//

import UIKit

@main
class AppDelegate: UIResponder  {
    
    class var shared: AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }
    
    lazy var window: UIWindow? = {
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.backgroundColor = .white
        return window
    }()
    
    private lazy var homeNavigationController: UINavigationController = {
        let viewController = HomeViewController(HomeViewModel(HomeModel()))
        let navigationController = UINavigationController(rootViewController: viewController)
        return navigationController
    }()
}

extension AppDelegate: UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
     
        window!.rootViewController = homeNavigationController
        window!.makeKeyAndVisible()
        
        return true
    }
}
