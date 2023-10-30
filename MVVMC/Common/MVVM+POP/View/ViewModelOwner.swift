//
//  ViewModelOwner.swift
//  MVVMC
//
//  Created by sam on 2023/10/30.
//

import Foundation

public protocol ViewModelOwner: AnyObject {
    
    associatedtype VM
    
    var viewModel: VM { get set }
}
