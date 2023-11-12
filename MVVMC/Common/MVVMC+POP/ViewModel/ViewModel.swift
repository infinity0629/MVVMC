//
//  ViewModel.swift
//  MVVMC
//
//  Created by sam on 2023/10/30.
//

import Foundation
import RxSwift

public protocol ViewModel: AnyObject {
    
    var disposeBag: DisposeBag { get set }
}

private struct AssociatedKey {
    static var disposeBag: Int = 0
}

public extension ViewModel {
    
    var disposeBag: DisposeBag {
        get { associatedLazyObject(self, &AssociatedKey.disposeBag) { DisposeBag() } }
        set { setAssociatedObject(self, &AssociatedKey.disposeBag, newValue) }
    }
}
