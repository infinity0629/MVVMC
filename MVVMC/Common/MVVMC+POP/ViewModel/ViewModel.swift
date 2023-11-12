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

private struct AssociatedSubjectKey {
    static var disposeBag: Int = 0
}

public extension ViewModel {
    
    var disposeBag: DisposeBag {
        get { associatedLazyObject(self, &AssociatedSubjectKey.disposeBag) { DisposeBag() } }
        set { setAssociatedObject(self, &AssociatedSubjectKey.disposeBag, newValue) }
    }
}
