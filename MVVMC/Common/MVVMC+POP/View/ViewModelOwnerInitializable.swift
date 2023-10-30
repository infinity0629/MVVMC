//
//  ViewModelOwnerInitializable.swift
//  MVVMC
//
//  Created by sam on 2023/10/30.
//

import Foundation

public protocol ViewModelOwnerInitializable: ViewModelOwner {
    
    init(_ viewModel: VM)
}
