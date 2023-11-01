//
//  ProductTableViewCell.swift
//  MVVMC
//
//  Created by sam on 2023/10/28.
//

import RxSwift
import UIKit
import RxCocoa

class ProductTableViewCell: NiblessTableViewCell, CellViewModelOwner {
    
    override init() {
        super.init()
        setLayout()
        setConstraint()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        disposeBag = DisposeBag()
    }
    
    func setLayout() {
        
    }
    
    func setConstraint() {
        
    }
    
    func setContent(with viewModel: any ProductCellViewModel) {
        textLabel?.text = viewModel.title
        print(viewModel.entity)
    }
}
