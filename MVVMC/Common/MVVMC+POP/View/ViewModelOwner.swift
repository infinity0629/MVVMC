//
//  ViewModelOwner.swift
//  MVVMC
//
//  Created by sam on 2023/10/30.
//

import Foundation
import RxSwift

public protocol ViewModelOwner: AnyObject {
    
    associatedtype VM
    
    var disposeBag: DisposeBag { get set }
    
    var viewModel: VM { get set }
}

private struct AssociatedSubjectKey {
    static var disposeBag: Int = 0
}

public extension ViewModelOwner {
    
    var disposeBag: DisposeBag {
        get { associatedLazyObject(self, &AssociatedSubjectKey.disposeBag) { DisposeBag() } }
        set { setAssociatedObject(self, &AssociatedSubjectKey.disposeBag, newValue) }
    }
}
