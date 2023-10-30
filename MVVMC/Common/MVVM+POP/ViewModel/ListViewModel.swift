//
//  ListViewModel.swift
//  MVVMC
//
//  Created by sam on 2023/10/30.
//

import Foundation
import RxSwift
import RxRelay

public protocol ListViewModel: ViewModel {
    
    associatedtype CVM
    
    var cellViewModels: BehaviorRelay<[CVM]> { get }
}
