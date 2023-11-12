//
//  Runtime.swift
//  MVVMC
//
//  Created by sam on 2023/11/12.
//

import Foundation
import ObjectiveC.runtime

public enum AssociationPolicy {
    case assign
    case retain_atomic
    case retain_nonatomic
    case copy_atomic
    case copy_nonatomic
    
    fileprivate var ObjcAssociationPolicy: objc_AssociationPolicy {
        return switch self {
        case .assign: .OBJC_ASSOCIATION_ASSIGN
        case .retain_atomic: .OBJC_ASSOCIATION_RETAIN
        case .retain_nonatomic: .OBJC_ASSOCIATION_RETAIN_NONATOMIC
        case .copy_atomic: .OBJC_ASSOCIATION_COPY
        case .copy_nonatomic: .OBJC_ASSOCIATION_COPY_NONATOMIC
        }
    }
}

public func associatedObject<T>(_ object: AnyObject,
                                _ key: UnsafeRawPointer) -> T? {
    objc_getAssociatedObject(object, key) as? T
}

public func associatedLazyObject<T>(_ object: AnyObject,
                                    _ key: UnsafeRawPointer,
                                    _ initialValue: () -> T) -> T {
    
    guard let prev: T = associatedObject(object, key) else {
        let current = initialValue()
        setAssociatedObject(object, key, current)
        return current
    }
    
    return prev
}

public func setAssociatedObject<T>(_ object: AnyObject,
                                   _ key: UnsafeRawPointer,
                                   _ value: T,
                                   _ associationPolicy: AssociationPolicy = .retain_nonatomic) {
    objc_setAssociatedObject(object, key, value, associationPolicy.ObjcAssociationPolicy)
}
