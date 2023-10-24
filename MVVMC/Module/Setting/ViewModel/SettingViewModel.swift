//
//  SettingViewModel.swift
//  MVVMC
//
//  Created by sam on 2023/10/8.
//

import Foundation

struct SettingViewModel: ViewModel {
    
    var model: SettingModel
    
    init(_ model: SettingModel) {
        self.model = model
    }
}
