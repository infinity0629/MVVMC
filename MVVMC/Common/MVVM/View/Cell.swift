//
//  Cell.swift
//  MVVMC
//
//  Created by sam on 2023/10/28.
//

import UIKit

public protocol Cell<VM>: AnyObject {
    
    associatedtype VM: CellViewModel
    
    func setBinding(with viewModel: VM)
}

extension Cell {
    
    public static var reuseIdentifier: String {
        String(describing: self)
    }
}
