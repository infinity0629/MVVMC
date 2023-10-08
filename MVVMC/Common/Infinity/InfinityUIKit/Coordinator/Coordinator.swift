//
//  Coordinator.swift
//  MVVMC
//
//  Created by sam on 2023/10/6.
//

import Foundation

public protocol Coordinator: AnyObject {

    var children: [Coordinator] { get set }
    var router: Router { get }
    
    func start(animated: Bool, onEnded: (() -> Void)?)
}

extension Coordinator {
    
    public func start(animated: Bool) {
        start(animated: animated, onEnded: nil)
    }
    
    public func startChild(_ child: Coordinator, animated: Bool, onEnded: (() -> Void)?) {
        children.append(child)
        child.start(animated: animated) { [weak self, weak child] in
            guard let self, let child else {
                return
            }
            self.removeChild(child)
            onEnded?()
        }
    }
    
    public func end(animated: Bool) {
        router.end(animated: animated)
    }
    
    private func removeChild(_ child: Coordinator) {
        guard let index = children.firstIndex(where: { $0 === child }) else {
            return
        }
        children.remove(at: index)
    }
}
