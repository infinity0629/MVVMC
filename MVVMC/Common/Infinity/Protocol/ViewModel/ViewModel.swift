//
//  ViewModel.swift
//  MVVMC
//
//  Created by sam on 2023/10/6.
//

import Foundation

public protocol ViewModel {
    
    associatedtype M: Model
    
    var model: Model { get set }
    
    init(_ model: Model)
}
