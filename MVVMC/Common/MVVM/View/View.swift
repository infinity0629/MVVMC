//
//  View.swift
//  MVVMC
//
//  Created by sam on 2023/10/6.
//

import UIKit

public protocol View: AnyObject {
    
    associatedtype VM
    
    var viewModel: VM { get set }
    
    init(_ viewModel: VM)
}
