//
//  View.swift
//  MVVMC
//
//  Created by sam on 2023/10/6.
//

import Foundation

public protocol View<ViewModelType>: AnyObject {
    
    associatedtype ViewModelType: ViewModel
    
    var viewModel: ViewModelType { get set }
    
    init(_ viewModel: ViewModelType)
}
