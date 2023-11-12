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

private struct AssociatedKey {
    static var viewModel: Int = 0
    static var disposeBag: Int = 0
}

public extension ViewModelOwner {
    
    var viewModel: VM {
        get { associatedObject(self, &AssociatedKey.viewModel)! }
        set { setAssociatedObject(self, &AssociatedKey.viewModel, newValue) }
    }
    
    var disposeBag: DisposeBag {
        get { associatedLazyObject(self, &AssociatedKey.disposeBag) { DisposeBag() } }
        set { setAssociatedObject(self, &AssociatedKey.disposeBag, newValue) }
    }
}
