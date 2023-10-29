//
//  ProductViewController.swift
//  MVVMC
//
//  Created by sam on 2023/10/9.
//

import UIKit
import RxSwift
import RxCocoa
import Then

class ProductViewController<VM: INFListViewModel & ProductViewModel>: INFTableViewController<VM>  {
    
    override func setLayout() {
        view.backgroundColor = .white
    }
    
    override func setConstraint() {
        
    }
    
    override func setBinding() {
        
//        viewModel.cellViewModels
//            .bind(to: tableView.rx.items) { (tableView, row, cellViewModel) in
//                tableView.dequeueReusableCell(cell: ProductTableViewCell<ProductCellViewModelImpl>.self, viewModel: cellViewModel)
//            }
//            .disposed(by: disposeBag)
    }
}
