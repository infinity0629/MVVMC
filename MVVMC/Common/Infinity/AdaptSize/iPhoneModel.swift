//
//  iPhoneModel.swift
//  MVVMC
//
//  Created by sam on 2023/10/10.
//

import UIKit

public enum iPhoneModel {
    case _SE_1_, _SE_2_, _SE_3_
    case _5_, _5s_, _5c_
    case _6_, _6_Plus_, _6s_, _6s_Plus_
    case _7_, _7_Plus_
    case _8_, _8_Plus_
    case _Xr_, _X_, _Xs_, _Xs_Max_
    case _11_, _11_Pro_, _11_Pro_Max_
    case _12_mini_, _12_, _12_Pro_, _12_Pro_Max_
    case _13_mini_, _13_, _13_Pro_, _13_Pro_Max_
    case _14_, _14_Plus_, _14_Pro_, _14_Pro_Max_
    case _15_, _15_Plus_, _15_Pro_, _15_Pro_Max_
}

extension iPhoneModel {
    
    public var screen: Screen {
        switch self {
        case ._5_, ._5s_, ._5c_, ._SE_1_: return Screen.screen1
        case ._6_, ._6s_, ._7_, ._8_, ._SE_2_, ._SE_3_: return Screen.screen2
        case ._6_Plus_, ._6s_Plus_, ._7_Plus_, ._8_Plus_: return Screen.screen3
        case ._X_, ._Xs_, ._11_Pro_: return Screen.screen4
        case ._Xs_Max_, ._11_Pro_Max_: return Screen.screen5
        case ._Xr_, ._11_: return Screen.screen6
        case ._12_mini_, ._13_mini_: return Screen.screen7
        case ._12_, ._12_Pro_, ._13_, ._13_Pro_, ._14_: return Screen.screen8
        case ._14_Pro_, ._15_, ._15_Pro_: return Screen.screen9
        case ._12_Pro_Max_, ._13_Pro_Max_, ._14_Plus_: return Screen.screen10
        case ._14_Pro_Max_, ._15_Plus_, ._15_Pro_Max_: return Screen.screen11
        }
    }
}

public enum Inch: Double  {
    case _40 = 4.0
    case _47 = 4.7
    case _54 = 5.4
    case _55 = 5.5
    case _58 = 5.8
    case _61 = 6.1
    case _65 = 6.5
    case _67 = 6.7
}

public struct Screen {
    
    public let inch: Inch
    public let size: CGSize
//    let scale: Double
    
    // iPhone SE(3rd generation)
    // 放大
    //    (320.0, 568.0) 2.0

    // iPhone 15 / iPhone 15 Pro
    // 放大
    //    (320.0, 693.0) 3.0

    // iPhone 15 Pro Max / iPhone 15 Plus
    // 放大
    //    (375.0, 812.0) 3.0

    // iPhone 12/13 Mini
    // 放大
    //    (320.0, 693.0) 3.0
    
    public var isZoomed: Bool {
        UIScreen.main.scale < UIScreen.main.nativeScale
    }
    
    public static var screen1: Screen {
//        Screen(inch: ._40, size: CGSize(width: 320.0, height: 568.0), scale: 2.0)
        Screen(inch: ._40, size: CGSize(width: 320.0, height: 568.0))
    }
    
    public static var screen2: Screen {
//        Screen(inch: ._47, size: CGSize(width: 375.0, height: 667.0), scale: 2.0)
        Screen(inch: ._47, size: CGSize(width: 375.0, height: 667.0))
    }
    
    public static var screen3: Screen {
//        Screen(inch: ._55, size: CGSize(width: 414.0, height: 736.0), scale: 3.0)
        Screen(inch: ._55, size: CGSize(width: 414.0, height: 736.0))
    }
    
    public static var screen4: Screen {
//        Screen(inch: ._58, size: CGSize(width: 375.0, height: 812.0), scale: 3.0)
        Screen(inch: ._58, size: CGSize(width: 375.0, height: 812.0))
    }
    
    public static var screen5: Screen {
//        Screen(inch: ._65, size: CGSize(width: 414.0, height: 896.0), scale: 3.0)
        Screen(inch: ._65, size: CGSize(width: 414.0, height: 896.0))
    }
    
    public static var screen6: Screen {
//        Screen(inch: ._61, size: CGSize(width: 414.0, height: 896.0), scale: 2.0)
        Screen(inch: ._61, size: CGSize(width: 414.0, height: 896.0))
    }
    
    public static var screen7: Screen {
//        Screen(inch: ._54, size: CGSize(width: 375.0, height: 812.0), scale: 3.0)
        Screen(inch: ._54, size: CGSize(width: 375.0, height: 812.0))
    }
    
    public static var screen8: Screen {
//        Screen(inch: ._61, size: CGSize(width: 390.0, height: 844.0), scale: 3.0)
        Screen(inch: ._61, size: CGSize(width: 390.0, height: 844.0))
    }
    
    public static var screen9: Screen {
//        Screen(inch: ._61, size: CGSize(width: 393.0, height: 852.0), scale: 3.0)
        Screen(inch: ._61, size: CGSize(width: 393.0, height: 852.0))
    }
    
    public static var screen10: Screen {
//        Screen(inch: ._67, size: CGSize(width: 428.0, height: 926.0), scale: 3.0)
        Screen(inch: ._67, size: CGSize(width: 428.0, height: 926.0))
    }
    
    public static var screen11: Screen {
//        Screen(inch: ._67, size: CGSize(width: 430.0, height: 932.0), scale: 3.0)
        Screen(inch: ._67, size: CGSize(width: 430.0, height: 932.0))
    }
}

extension Screen: CustomStringConvertible {
    
    public var description: String {
//        "width:\(size.width) height:\(size.height) scale:\(scale) inch:\(inch.rawValue)"
        "width:\(size.width) height:\(size.height) inch:\(inch.rawValue)"
    }
}
