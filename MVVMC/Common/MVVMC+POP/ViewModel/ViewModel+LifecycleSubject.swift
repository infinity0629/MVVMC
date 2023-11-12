//
//  ViewModel+LifecycleSubject.swift
//  MVVMC
//
//  Created by sam on 2023/10/30.
//

import Foundation
import ObjectiveC.runtime
import RxSwift

private struct AssociatedSubjectKey {
    static var viewDidLoad: Int = 0
    static var viewWillAppear: Int = 0
    static var viewDidAppear: Int = 0
    static var viewWillDisappear: Int = 0
    static var viewDidDisappear: Int = 0
    static var viewWillLayoutSubviews: Int = 0
    static var viewDidLayoutSubviews: Int = 0
    static var viewSafeAreaInsetsDidChange: Int = 0
}

public extension ViewModel {

    var viewDidLoadSubject: PublishSubject<Void> { associatedLazyObject(self, &AssociatedSubjectKey.viewDidLoad) { PublishSubject<Void>() } }
    
    var viewWillAppearSubject: PublishSubject<Void> { associatedLazyObject(self, &AssociatedSubjectKey.viewWillAppear) { PublishSubject<Void>() } }
    
    var viewDidAppearSubject: PublishSubject<Void> { associatedLazyObject(self, &AssociatedSubjectKey.viewDidAppear) { PublishSubject<Void>() } }

    var viewWillDisappearSubject: PublishSubject<Void> { associatedLazyObject(self, &AssociatedSubjectKey.viewWillDisappear) { PublishSubject<Void>() } }
    
    var viewDidDisappearSubject: PublishSubject<Void> { associatedLazyObject(self, &AssociatedSubjectKey.viewDidDisappear) { PublishSubject<Void>() } }
    
    var viewWillLayoutSubviewsSubject: PublishSubject<Void> { associatedLazyObject(self, &AssociatedSubjectKey.viewWillLayoutSubviews) { PublishSubject<Void>() } }
    
    var viewDidLayoutSubviewsSubject: PublishSubject<Void> { associatedLazyObject(self, &AssociatedSubjectKey.viewDidLayoutSubviews) { PublishSubject<Void>() } }
    
    var viewSafeAreaInsetsDidChangeSubject: PublishSubject<Void> { associatedLazyObject(self, &AssociatedSubjectKey.viewSafeAreaInsetsDidChange) { PublishSubject<Void>() } }
    
    var viewDidLoad: Observable<Void> {
        viewDidLoadSubject.asObservable()
    }
    
    var viewWillAppear: Observable<Void> {
        viewWillAppearSubject.asObservable()
    }
    
    var viewDidAppear: Observable<Void> {
        viewDidAppearSubject.asObservable()
    }
    
    var viewWillDisappear: Observable<Void> {
        viewWillDisappearSubject.asObservable()
    }
    
    var viewDidDisappear: Observable<Void> {
        viewDidDisappearSubject.asObservable()
    }
    
    var viewWillLayoutSubviews: Observable<Void> {
        viewWillLayoutSubviewsSubject.asObservable()
    }
    
    var viewDidLayoutSubviews: Observable<Void> {
        viewDidLayoutSubviewsSubject.asObservable()
    }
    
    var viewSafeAreaInsetsDidChange: Observable<Void> {
        viewSafeAreaInsetsDidChangeSubject.asObservable()
    }
}
