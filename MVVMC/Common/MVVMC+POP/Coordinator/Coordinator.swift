//
//  Coordinator.swift
//  MVVMC
//
//  Created by sam on 2023/10/6.
//

import UIKit
import RxSwift

public protocol Coordinator: AnyObject {
    
    var router: Router { get }
    var startViewController: UIViewController { get }
    
    init(router: Router)
}

public extension Coordinator {
    
    func start(animated: Bool = true, onEnded: (() -> Void)? = nil) {
        router.start(startViewController, animated: animated, onEnded: onEnded)
    }
    
    func end(animated: Bool = true) {
        router.end(animated: animated)
    }
    
    func startChild(_ child: Coordinator, animated: Bool = true, onEnded: (() -> Void)? = nil) {
        children.append(child)
        child.start(animated: animated) { [weak self, weak child] in
            guard let self, let child else {
                return
            }
            removeChild(child)
            onEnded?()
        }
        print("\(self) start ---- children: \(children)")
    }
    
    private func removeChild(_ child: Coordinator) {
        guard let index = children.firstIndex(where: { $0 === child }) else {
            return
        }
        children.remove(at: index)
        print("\(self) end ------ children: \(children)")
    }
}

private struct AssociatedSubjectKey {
    static var children: Int = 0
    static var disposeBag: Int = 0
}

public extension Coordinator {
    
    var children: [Coordinator] {
        get {
            guard let c = objc_getAssociatedObject(self, &AssociatedSubjectKey.children) else {
                let c =  [Coordinator]()
                objc_setAssociatedObject(self, &AssociatedSubjectKey.children, c, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
                return c
            }
            return c as! [Coordinator]
        }
        set {
            objc_setAssociatedObject(self, &AssociatedSubjectKey.children, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
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
