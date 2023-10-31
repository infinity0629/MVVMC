//
//  ProductViewModel.swift
//  MVVMC
//
//  Created by sam on 2023/10/9.
//

import Foundation
import RxSwift
import RxRelay

class ProductViewModelImpl: ProductViewModel {
    
    let cellViewModels = BehaviorRelay<[any ProductCellViewModel]>(value: [])
    
    var title: String = "Product"
    
    init() {
        viewDidLoad
            .subscribe {
                print($0)
            }
            .disposed(by: disposeBag)
        
        viewWillAppear
            .subscribe {
                print($0)
            }
            .disposed(by: disposeBag)
        
        cellViewModels.accept([
            ProductCellViewModelImpl(ProductEntity()),
            ProductCellViewModelImpl(ProductEntity())
        ])
    }
}
