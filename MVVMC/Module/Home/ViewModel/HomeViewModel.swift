//
//  HomeViewModel.swift
//  MVVMC
//
//  Created by sam on 2023/10/6.
//

import Foundation
import InfinityUIKit

struct HomeViewModel: ViewModel {
    
    var model: HomeModel
    
    init(_ model: HomeModel) {
        self.model = model
    }
}
