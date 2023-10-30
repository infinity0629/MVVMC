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
    
    override init(style: CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: Self.reuseIdentifier)
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
    
    func setBinding(with viewModel: any ProductCellViewModel) {
        textLabel?.text = viewModel.title
        print(viewModel.entity)
    }
}
