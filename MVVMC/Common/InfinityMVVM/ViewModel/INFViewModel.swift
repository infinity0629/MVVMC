//
//  INFViewModel.swift
//  MVVMC
//
//  Created by sam on 2023/10/29.
//

import UIKit
import RxSwift

open class INFViewModel: NSObject {

    public let disposeBag = DisposeBag()
    
    public let viewDidLoadSubject = PublishSubject<Void>()
    public let viewWillAppearSubject = PublishSubject<Void>()
    public let viewDidAppearSubject = PublishSubject<Void>()
    public let viewWillDisappearSubject = PublishSubject<Void>()
    public let viewDidDisappearSubject = PublishSubject<Void>()
    public let viewWillLayoutSubviewsSubject = PublishSubject<Void>()
    public let viewDidLayoutSubviewsSubject = PublishSubject<Void>()
    public let viewSafeAreaInsetsDidChangeSubject = PublishSubject<Void>()
    
    public var viewDidLoad: Observable<Void> {
        viewDidLoadSubject.asObservable()
    }
    
    public var viewWillAppear: Observable<Void> {
        viewWillAppearSubject.asObservable()
    }
    
    public var viewDidAppear: Observable<Void> {
        viewDidAppearSubject.asObservable()
    }
    
    public var viewWillDisappear: Observable<Void> {
        viewWillDisappearSubject.asObservable()
    }
    
    public var viewDidDisappear: Observable<Void> {
        viewDidDisappearSubject.asObservable()
    }
    
    public var viewWillLayoutSubviews: Observable<Void> {
        viewWillLayoutSubviewsSubject.asObservable()
    }
    
    public var viewDidLayoutSubviews: Observable<Void> {
        viewDidLayoutSubviewsSubject.asObservable()
    }
    
    public var viewSafeAreaInsetsDidChange: Observable<Void> {
        viewSafeAreaInsetsDidChangeSubject.asObservable()
    }
}
