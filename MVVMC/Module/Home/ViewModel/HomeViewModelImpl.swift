//
//  HomeViewModel.swift
//  MVVMC
//
//  Created by sam on 2023/10/6.
//

import Foundation
import RxSwift

struct HomeViewModelImpl<M: HomeModel>: HomeViewModel {
    
    var model: M
    
    let accountSubject = PublishSubject<Void>()
    
    let settingSubject = PublishSubject<Void>()
    
    init(_ model: M) {
        self.model = model
    }
}
