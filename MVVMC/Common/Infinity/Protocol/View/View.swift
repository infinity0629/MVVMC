//
//  View.swift
//  MVVMC
//
//  Created by sam on 2023/10/6.
//

import Foundation

public protocol View: AnyObject {
    
    associatedtype VM: ViewModel
    
    var viewModel: VM { get set }
    
    init(_ viewModel: VM)
}
