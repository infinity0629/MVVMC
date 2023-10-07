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
    
    func present(animated: Bool, onDismissed: (() -> Void)?)
    func present(animated: Bool)
    func presentChild(_ child: Coordinator, animated: Bool, onDismissed: (() -> Void)?)
    func dismiss(animated: Bool)
}

extension Coordinator {
    
    public func present(animated: Bool) {
        present(animated: animated, onDismissed: nil)
    }
    
    public func presentChild(_ child: Coordinator, animated: Bool, onDismissed: (() -> Void)?) {
        children.append(child)
        child.present(animated: animated) { [weak self, weak child] in
            guard let self, let child else {
                return
            }
            self.removeChild(child)
            onDismissed?()
        }
    }
    
    public func dismiss(animated: Bool) {
        router.dismiss(animated: animated)
    }
    
    private func removeChild(_ child: Coordinator) {
        guard let index = children.firstIndex(where: { $0 === child }) else {
            return
        }
        children.remove(at: index)
    }
}
