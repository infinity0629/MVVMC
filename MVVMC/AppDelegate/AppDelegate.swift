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
        
//        print(UIScreen.main.bounds.size, UIScreen.main.nativeBounds.size, UIScreen.main.scale, UIScreen.main.nativeScale)
//        
//        
//        print(CGSize(width: UIScreen.main.nativeBounds.size.width / UIScreen.main.scale,
//                     height: UIScreen.main.nativeBounds.size.height / UIScreen.main.scale))
        
        print("------------------------------")
//        print(iPhone._13_mini_)
//        print(iPhone._13_mini_.size.scaleFactor)
//        print(UIScreen.main.bounds.size)
//        print(UIScreen.main.bounds.size.scaleFactor)
        
        print(CGSize(width: UIScreen.main.nativeBounds.size.width,
                     height: UIScreen.main.nativeBounds.size.height))
        print(CGSize(width: UIScreen.main.nativeBounds.size.width / UIScreen.main.scale,
                     height: UIScreen.main.nativeBounds.size.height / UIScreen.main.scale))
        
        print(CGSize(width: UIScreen.main.bounds.size.width,
                     height: UIScreen.main.bounds.size.height))
        
        print(DeviceModel._15_Pro_Max_.screen.size)
        print(10.0.scale(._15_Pro_Max_))
        print("------------------------------")
        
        
//        (320.0, 693.0) (1080.0, 2340.0) 3.0 3.375
//        width:375.0 height:812.0 scale:3.0 inch:5.4
//        (360.0, 780.0)
        
//        (375.0, 812.0) (1080.0, 2340.0) 3.0 2.88
//        width:375.0 height:812.0 scale:3.0 inch:5.4
//        (360.0, 780.0)
        
        return true
    }
}



