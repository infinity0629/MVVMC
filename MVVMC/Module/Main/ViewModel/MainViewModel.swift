//
//  MainViewModel.swift
//  MVVMC
//
//  Created by sam on 2023/10/9.
//

import Foundation

struct MainViewModel: ViewModel {
    
    var model: MainModel
    
    init(_ model: MainModel) {
        self.model = model
    }
}
