//
//  ViewModelOwnerInitializable+UIViewController.swift
//  MVVMC
//
//  Created by sam on 2023/10/30.
//

import Foundation
import UIKit
import RxSwift

private struct AssociatedKey {
    static var viewDidLoad: Int = 0
    static var viewWillAppear: Int = 0
    static var viewDidAppear: Int = 0
    static var viewWillDisappear: Int = 0
    static var viewDidDisappear: Int = 0
    static var viewWillLayoutSubviews: Int = 0
    static var viewDidLayoutSubviews: Int = 0
    static var viewSafeAreaInsetsDidChange: Int = 0
}

public extension ViewModelOwnerInitializable where Self: UIViewController, VM: ViewModel {
    
    init(_ viewModel: VM) {
        self.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
        setLifecycleBinding()
    }
    
    private func setLifecycleBinding() {

        rx.methodInvoked(#selector(viewDidLoad))
            .map { _ in }
            .bind(to: viewModel.viewDidLoadSubject)
            .disposed(by: disposeBag)
        
        rx.methodInvoked(#selector(viewWillAppear(_:)))
            .map { _ in }
            .bind(to: viewModel.viewWillAppearSubject)
            .disposed(by: disposeBag)
        
        rx.methodInvoked(#selector(viewDidAppear))
            .map { _ in }
            .bind(to: viewModel.viewDidAppearSubject)
            .disposed(by: disposeBag)
        
        rx.methodInvoked(#selector(viewWillDisappear(_:)))
            .map { _ in }
            .bind(to: viewModel.viewWillDisappearSubject)
            .disposed(by: disposeBag)
        
        rx.methodInvoked(#selector(viewDidDisappear(_:)))
            .map { _ in }
            .bind(to: viewModel.viewDidDisappearSubject)
            .disposed(by: disposeBag)
        
        rx.methodInvoked(#selector(viewWillLayoutSubviews))
            .map { _ in }
            .bind(to: viewModel.viewWillLayoutSubviewsSubject)
            .disposed(by: disposeBag)
        
        rx.methodInvoked(#selector(viewDidLayoutSubviews))
            .map { _ in }
            .bind(to: viewModel.viewDidLayoutSubviewsSubject)
            .disposed(by: disposeBag)
        
        rx.methodInvoked(#selector(viewSafeAreaInsetsDidChange))
            .map { _ in }
            .bind(to: viewModel.viewSafeAreaInsetsDidChangeSubject)
            .disposed(by: disposeBag)
    }
}

public extension ViewModel {
    
    var viewDidLoad: Observable<Void> { viewDidLoadSubject.asObservable() }
    var viewWillAppear: Observable<Void> { viewWillAppearSubject.asObservable() }
    var viewDidAppear: Observable<Void> { viewDidAppearSubject.asObservable() }
    var viewWillDisappear: Observable<Void> { viewWillDisappearSubject.asObservable() }
    var viewDidDisappear: Observable<Void> { viewDidDisappearSubject.asObservable() }
    var viewWillLayoutSubviews: Observable<Void> { viewWillLayoutSubviewsSubject.asObservable() }
    var viewDidLayoutSubviews: Observable<Void> { viewDidLayoutSubviewsSubject.asObservable() }
    var viewSafeAreaInsetsDidChange: Observable<Void> { viewSafeAreaInsetsDidChangeSubject.asObservable() }

    fileprivate var viewDidLoadSubject: PublishSubject<Void> { associatedLazyObject(self, &AssociatedKey.viewDidLoad) { PublishSubject<Void>() } }
    fileprivate var viewWillAppearSubject: PublishSubject<Void> { associatedLazyObject(self, &AssociatedKey.viewWillAppear) { PublishSubject<Void>() } }
    fileprivate var viewDidAppearSubject: PublishSubject<Void> { associatedLazyObject(self, &AssociatedKey.viewDidAppear) { PublishSubject<Void>() } }
    fileprivate var viewWillDisappearSubject: PublishSubject<Void> { associatedLazyObject(self, &AssociatedKey.viewWillDisappear) { PublishSubject<Void>() } }
    fileprivate var viewDidDisappearSubject: PublishSubject<Void> { associatedLazyObject(self, &AssociatedKey.viewDidDisappear) { PublishSubject<Void>() } }
    fileprivate var viewWillLayoutSubviewsSubject: PublishSubject<Void> { associatedLazyObject(self, &AssociatedKey.viewWillLayoutSubviews) { PublishSubject<Void>() } }
    fileprivate var viewDidLayoutSubviewsSubject: PublishSubject<Void> { associatedLazyObject(self, &AssociatedKey.viewDidLayoutSubviews) { PublishSubject<Void>() } }
    fileprivate var viewSafeAreaInsetsDidChangeSubject: PublishSubject<Void> { associatedLazyObject(self, &AssociatedKey.viewSafeAreaInsetsDidChange) { PublishSubject<Void>() } }
}
