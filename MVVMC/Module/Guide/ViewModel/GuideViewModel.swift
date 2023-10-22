//
//  GuideViewModel.swift
//  MVVMC
//
//  Created by sam on 2023/10/9.
//

import Foundation
import InfinityUIKit

struct GuideViewModel: ViewModel {
    
    var model: GuideModel
    
    init(_ model: GuideModel) {
        self.model = model
    }
}
