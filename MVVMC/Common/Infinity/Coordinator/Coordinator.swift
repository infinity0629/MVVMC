//
//  Coordinator.swift
//  MVVMC
//
//  Created by sam on 2023/10/6.
//

import Foundation

public protocol Coordinator: AnyObject {

    var router: Router { get }
    var children: [Coordinator] { get set }
    
    init(router: Router)
    
    func start(animated: Bool, onEnded: (() -> Void)?)
}

extension Coordinator {
    
    public func start(animated: Bool = true) {
        start(animated: animated, onEnded: nil)
    }
    
    public func end(animated: Bool = true) {
        router.end(animated: animated)
    }
    
    public func startChild(_ child: Coordinator, animated: Bool = true) {
        startChild(child, animated: animated, onEnded: nil)
    }
    
    public func startChild(_ child: Coordinator, animated: Bool = true, onEnded: (() -> Void)?) {
        children.append(child)
        child.start(animated: animated) { [weak self, weak child] in
            guard let self, let child else {
                return
            }
            self.removeChild(child)
            onEnded?()
        }
    }
    
    private func removeChild(_ child: Coordinator) {
        guard let index = children.firstIndex(where: { $0 === child }) else {
            return
        }
        children.remove(at: index)
    }
}
