//
//  ViewModel.swift
//  MVVMC
//
//  Created by sam on 2023/10/6.
//

import Foundation

public protocol ViewModel {
    
    associatedtype ModelType: Model
    
    var model: ModelType { get set }
    
    init(_ model: ModelType)
}
