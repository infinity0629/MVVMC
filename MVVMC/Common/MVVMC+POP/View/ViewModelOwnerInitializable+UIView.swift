//
//  ViewModelOwnerInitializable+UIView.swift
//  MVVMC
//
//  Created by sam on 2023/11/12.
//

import Foundation
import UIKit

public extension ViewModelOwnerInitializable where Self: UIView, VM: ViewModel {
    
    init(_ viewModel: VM) {
        self.init(frame: .zero)
        self.viewModel = viewModel
    }
}
