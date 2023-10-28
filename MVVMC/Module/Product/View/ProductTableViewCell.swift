//
//  ProductTableViewCell.swift
//  MVVMC
//
//  Created by sam on 2023/10/28.
//

import UIKit

class ProductTableViewCell<VM: ProductCellViewModel>: NiblessTableViewCell, Cell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: Self.reuseIdentifier)
    }
    
    func setBinding(with viewModel: VM) {
        
    }
}
