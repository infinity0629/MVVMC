//
//  Cell.swift
//  MVVMC
//
//  Created by sam on 2023/10/28.
//

import UIKit

public protocol Cell: AnyObject {
    
    associatedtype VM
    
    func setBinding(with viewModel: VM)
}

extension Cell {
    
    public static var reuseIdentifier: String {
        String(describing: self)
    }
}
