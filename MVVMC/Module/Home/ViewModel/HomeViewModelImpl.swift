//
//  HomeViewModel.swift
//  MVVMC
//
//  Created by sam on 2023/10/6.
//

import Foundation
import RxSwift

struct HomeViewModelImpl: HomeViewModel {
    
    var model: HomeModel
    
    let accountSubject = PublishSubject<Void>()
    
    let settingSubject = PublishSubject<Void>()
    
    init(_ model: HomeModel) {
        self.model = model
    }
}
