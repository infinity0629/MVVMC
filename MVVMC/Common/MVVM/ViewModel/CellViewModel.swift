//
//  CellViewModel.swift
//  MVVMC
//
//  Created by sam on 2023/10/28.
//

import Foundation

public protocol CellViewModel<E> {
    
    associatedtype E: JSONEntity
    
    var entity: E { get set }
    
    init(_ entity: E)
}
