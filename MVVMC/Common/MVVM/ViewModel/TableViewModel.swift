//
//  TableViewModel.swift
//  MVVMC
//
//  Created by sam on 2023/10/28.
//

import Foundation
import RxSwift
import RxRelay

public protocol TableViewModel: ViewModel {
    
    associatedtype CVM: CellViewModel
    
    var cellViewModels: BehaviorRelay<[CVM]> { get }
}
