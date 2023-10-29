//
//  INFViewController.swift
//  MVVMC
//
//  Created by sam on 2023/10/29.
//

import UIKit
import RxSwift
import RxCocoa

open class INFViewController<VM: INFViewModel>: NiblessViewController {
    
    public let disposeBag = DisposeBag()
    public let viewModel: VM

    public init(_ viewModel: VM) {
        self.viewModel = viewModel
        super.init()
        
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
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
        setConstraint()
        setBinding()
    }

    open func setLayout() {
        fatalError("\(#function) has not been overrided")
    }
    
    open func setConstraint() {
        fatalError("\(#function) has not been overrided")
    }
    
    open func setBinding() {
        fatalError("\(#function) has not been overrided")
    }
}
