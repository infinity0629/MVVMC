//
//  AccountViewModel.swift
//  MVVMC
//
//  Created by sam on 2023/10/8.
//

import Foundation
import RxSwift

struct AccountViewModel: ViewModel {
    
    var model: AccountModel
    
    let guideSubject = PublishSubject<Void>()
    
    init(_ model: AccountModel) {
        self.model = model
    }
}

