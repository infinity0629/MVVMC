//
//  UIScreen+Inch.swift
//  MVVMC
//
//  Created by sam on 2023/10/9.
//

import UIKit

public protocol AdaptSize {
    
    func scaleX(_ model: iPhoneModel) -> Double
    func scaleY(_ model: iPhoneModel) -> Double
}

extension AdaptSize {
    
    public func scale(_ model: iPhoneModel = ._15_Pro_Max_) -> Double {
        scaleX(model)
    }
}

extension Double: AdaptSize {
    
    public func scaleX(_ model: iPhoneModel = ._15_Pro_Max_) -> Double {
        Double(UIScreen.main.bounds.size.width / model.screen.size.width) * self
    }
    
    public func scaleY(_ model: iPhoneModel = ._15_Pro_Max_) -> Double {
        Double(UIScreen.main.bounds.size.height / model.screen.size.height) * self
    }
}

extension Int: AdaptSize {
    
    public func scaleX(_ model: iPhoneModel = ._15_Pro_Max_) -> Double {
        Double(UIScreen.main.bounds.size.width / model.screen.size.width) * Double(self)
    }
    
    public func scaleY(_ model: iPhoneModel = ._15_Pro_Max_) -> Double {
        Double(UIScreen.main.bounds.size.height / model.screen.size.height) * Double(self)
    }
}
