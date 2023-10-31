//
//  UIApplication+SafeArea.swift
//  MVVMC
//
//  Created by sam on 2023/10/31.
//

import UIKit

extension UIApplication {
    
    public static var safeAreaInsetsTop: CGFloat {
        safeAreaInsets.top
    }
    
    public static var safeAreaInsetsBottom: CGFloat {
        safeAreaInsets.bottom
    }
    
    public static var safeAreaInsets: UIEdgeInsets {
        if #available(iOS 13.0, *) {
            let scene = UIApplication.shared.connectedScenes.first
            guard let windowScene = scene as? UIWindowScene else { return UIEdgeInsets.zero }
            guard let window = windowScene.windows.first else { return UIEdgeInsets.zero }
            return window.safeAreaInsets
        } else if #available(iOS 11.0, *) {
            guard let window = UIApplication.shared.windows.first else { return UIEdgeInsets.zero }
            return window.safeAreaInsets
        }
        return UIEdgeInsets.zero
    }
}

extension UIApplication {
    
    public static var statusBarHeight: CGFloat {
        var statusBarHeight: CGFloat = 0.0
        if #available(iOS 13.0, *) {
            let scene = UIApplication.shared.connectedScenes.first
            guard let windowScene = scene as? UIWindowScene else { return 0.0 }
            guard let statusBarManager = windowScene.statusBarManager else { return 0.0 }
            statusBarHeight = statusBarManager.statusBarFrame.height
        } else {
            statusBarHeight = UIApplication.shared.statusBarFrame.height
        }
        return statusBarHeight
    }
    
    public static var navigationBarHeight: CGFloat {
        44.0
    }
    
    public static var navigationFullHeight: CGFloat {
        statusBarHeight + navigationBarHeight
    }
    
    public static var tabBarHeight: CGFloat {
        49.0
    }
    
    public static var tabBarFullHeight: CGFloat {
        tabBarHeight + safeAreaInsetsBottom
    }
}
