//
//  AdaptSizeFont.swift
//  MVVMC
//
//  Created by sam on 2023/10/10.
//

import UIKit

extension UIFont {
    
    static func scaleFont(ofSize fontSize: Double) -> UIFont {
        return self.systemFont(ofSize: CGFloat(fontSize.scale()))
    }
}
