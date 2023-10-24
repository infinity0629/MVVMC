//
//  ProductViewModel.swift
//  MVVMC
//
//  Created by sam on 2023/10/9.
//

import Foundation
import InfinityUIKit

struct ProductViewModelImpl<M: ProductModel>: ProductViewModel {
    
    var model: M
    
    init(_ model: M) {
        self.model = model
    }
}
