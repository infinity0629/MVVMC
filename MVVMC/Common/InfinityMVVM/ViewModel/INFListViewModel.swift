//
//  INFListViewModel.swift
//  MVVMC
//
//  Created by sam on 2023/10/29.
//

import UIKit
import RxRelay

open class INFListViewModel: INFViewModel {

    var cellViewModels = BehaviorRelay<[INFCellViewModel]>(value: [])
}
