//
//  ProductViewModel.swift
//  MVVMC
//
//  Created by sam on 2023/10/9.
//

import Foundation
import InfinityUIKit

struct ProductViewModel: ViewModel {
    
    var model: ProductModel
    
    init(_ model: ProductModel) {
        self.model = model
    }
}
