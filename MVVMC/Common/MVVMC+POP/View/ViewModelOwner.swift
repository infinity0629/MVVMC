//
//  ViewModelOwner.swift
//  MVVMC
//
//  Created by sam on 2023/10/30.
//

import Foundation
import ObjectiveC.runtime
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
        get {
            guard let bag = objc_getAssociatedObject(self, &AssociatedSubjectKey.disposeBag) else {
                let bag = DisposeBag()
                objc_setAssociatedObject(self, &AssociatedSubjectKey.disposeBag, bag, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
                return bag
            }
            return bag as! DisposeBag
        }
        set {
            objc_setAssociatedObject(self, &AssociatedSubjectKey.disposeBag, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}
