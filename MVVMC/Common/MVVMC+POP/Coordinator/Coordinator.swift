//
//  Coordinator.swift
//  MVVMC
//
//  Created by sam on 2023/10/6.
//

import UIKit
import RxSwift

open class Coordinator {
    
    var router: Router
    var disposeBag = DisposeBag()
    var children = [Coordinator]()
    var startViewController: UIViewController { UIViewController() }
    
    init(router: Router) {
        self.router = router
    }
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
