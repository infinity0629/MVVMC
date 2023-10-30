//
//  CellViewModel.swift
//  MVVMC
//
//  Created by sam on 2023/10/30.
//

import Foundation

public protocol CellViewModel {
    
    associatedtype E
    
    var entity: E { get }
    
    init(_ entity: E)
}
