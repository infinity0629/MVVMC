//
//  MainViewModel.swift
//  MVVMC
//
//  Created by sam on 2023/10/9.
//

import Foundation
import InfinityUIKit

struct MainViewModel: ViewModel {
    
    var model: MainModel
    
    init(_ model: MainModel) {
        self.model = model
    }
}
