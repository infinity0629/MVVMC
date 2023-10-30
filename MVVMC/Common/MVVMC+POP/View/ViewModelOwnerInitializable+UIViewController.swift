//
//  ViewModelOwnerInitializable+UIViewController.swift
//  MVVMC
//
//  Created by sam on 2023/10/30.
//

import Foundation
import ObjectiveC.runtime
import RxSwift
import UIKit
import Dispatch

public extension ViewModelOwnerInitializable where Self: UIViewController, VM: ViewModel {
    
    func setLifecycleBinding() {

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
