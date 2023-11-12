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
    
    var viewModel: VM { get set }
    
    var disposeBag: DisposeBag { get set }
}

private struct AssociatedSubjectKey {
    static var viewModel: Int = 0
    static var disposeBag: Int = 0
}

public extension ViewModelOwner {
    
    var viewModel: VM {
        get { associatedObject(self, &AssociatedSubjectKey.viewModel)! }
        set { setAssociatedObject(self, &AssociatedSubjectKey.viewModel, newValue) }
    }
    
    var disposeBag: DisposeBag {
        get { associatedLazyObject(self, &AssociatedSubjectKey.disposeBag) { DisposeBag() } }
        set { setAssociatedObject(self, &AssociatedSubjectKey.disposeBag, newValue) }
    }
}
