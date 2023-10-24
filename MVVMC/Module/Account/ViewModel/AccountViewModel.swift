//
//  AccountViewModel.swift
//  MVVMC
//
//  Created by sam on 2023/10/8.
//

import Foundation

struct AccountViewModel: ViewModel {
    
    var model: AccountModel
    
    init(_ model: AccountModel) {
        self.model = model
    }
}

