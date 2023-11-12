//
//  CellViewModelOwner.swift
//  MVVMC
//
//  Created by sam on 2023/10/30.
//

import Foundation
import RxSwift

public protocol CellViewModelOwner: AnyObject {
    
    associatedtype VM
    
    var disposeBag: DisposeBag { get set }
    
    func setContent(with viewModel: VM)
}

private struct AssociatedKey {
    static var disposeBag: Int = 0
}

public extension CellViewModelOwner {
    
    var disposeBag: DisposeBag {
        get { associatedLazyObject(self, &AssociatedKey.disposeBag) { DisposeBag() } }
        set { setAssociatedObject(self, &AssociatedKey.disposeBag, newValue) }
    }
}
