//
//  GuideViewModel.swift
//  MVVMC
//
//  Created by sam on 2023/10/9.
//

import Foundation
import RxSwift

struct GuideViewModel: ViewModel {
    
    var model: GuideModel
    
    let runAppSubject = PublishSubject<Void>()
    
    init(_ model: GuideModel) {
        self.model = model
    }
}
