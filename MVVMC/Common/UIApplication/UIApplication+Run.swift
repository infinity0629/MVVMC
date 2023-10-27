//
//  UIApplicationExtensions.swift
//  MVVMC
//
//  Created by sam on 2023/10/25.
//

import Foundation
import SwifterSwift

fileprivate enum UserDefaultsKeys: String {
    case appVersion
}

extension UIApplication {
    
    public static var isFirstRun: Bool {
        guard let currentVersion = UIApplication.shared.version else { return true }
        guard let oldVersion = UserDefaults.standard.value(forKey: UserDefaultsKeys.appVersion.rawValue) else { return true }
        return oldVersion as! String != currentVersion
    }
    
    public static func alreadyRun() {
        guard let currentVersion = UIApplication.shared.version else { return }
        UserDefaults.standard.set(currentVersion, forKey: UserDefaultsKeys.appVersion.rawValue)
        UserDefaults.standard.synchronize()
    }
}
