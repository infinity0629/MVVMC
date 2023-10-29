//
//  ProductTableViewCell.swift
//  MVVMC
//
//  Created by sam on 2023/10/28.
//

import UIKit

class ProductTableViewCell<VM: INFCellViewModel & ProductCellViewModel>: INFTableViewCell<VM> {
    
    override func setLayout() {
        
    }
    
    override func setConstraint() {
        
    }
    
    override func setBinding(with viewModel: VM) {
        textLabel?.text = String(describing: viewModel.entity)
    }
}
