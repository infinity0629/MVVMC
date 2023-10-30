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

    var viewDidLoadSubject: PublishSubject<Void> {
        guard let subject = objc_getAssociatedObject(self, &AssociatedSubjectKey.viewDidLoad) else {
            let subject = PublishSubject<Void>()
            objc_setAssociatedObject(self, &AssociatedSubjectKey.viewDidLoad, subject, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            return subject
        }
        return subject as! PublishSubject<Void>
    }
    
    var viewWillAppearSubject: PublishSubject<Void> {
        guard let subject = objc_getAssociatedObject(self, &AssociatedSubjectKey.viewWillAppear) else {
            let subject = PublishSubject<Void>()
            objc_setAssociatedObject(self, &AssociatedSubjectKey.viewWillAppear, subject, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            return subject
        }
        return subject as! PublishSubject<Void>
    }
    
    var viewDidAppearSubject: PublishSubject<Void> {
        guard let subject = objc_getAssociatedObject(self, &AssociatedSubjectKey.viewDidAppear) else {
            let subject = PublishSubject<Void>()
            objc_setAssociatedObject(self, &AssociatedSubjectKey.viewDidAppear, subject, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            return subject
        }
        return subject as! PublishSubject<Void>
    }
    
    var viewWillDisappearSubject: PublishSubject<Void> {
        guard let subject = objc_getAssociatedObject(self, &AssociatedSubjectKey.viewWillDisappear) else {
            let subject = PublishSubject<Void>()
            objc_setAssociatedObject(self, &AssociatedSubjectKey.viewWillDisappear, subject, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            return subject
        }
        return subject as! PublishSubject<Void>
    }
    
    var viewDidDisappearSubject: PublishSubject<Void> {
        guard let subject = objc_getAssociatedObject(self, &AssociatedSubjectKey.viewDidDisappear) else {
            let subject = PublishSubject<Void>()
            objc_setAssociatedObject(self, &AssociatedSubjectKey.viewDidDisappear, subject, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            return subject
        }
        return subject as! PublishSubject<Void>
    }
    
    var viewWillLayoutSubviewsSubject: PublishSubject<Void> {
        guard let subject = objc_getAssociatedObject(self, &AssociatedSubjectKey.viewWillLayoutSubviews) else {
            let subject = PublishSubject<Void>()
            objc_setAssociatedObject(self, &AssociatedSubjectKey.viewWillLayoutSubviews, subject, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            return subject
        }
        return subject as! PublishSubject<Void>
    }
    
    var viewDidLayoutSubviewsSubject: PublishSubject<Void> {
        guard let subject = objc_getAssociatedObject(self, &AssociatedSubjectKey.viewDidLayoutSubviews) else {
            let subject = PublishSubject<Void>()
            objc_setAssociatedObject(self, &AssociatedSubjectKey.viewDidLayoutSubviews, subject, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            return subject
        }
        return subject as! PublishSubject<Void>
    }
    
    var viewSafeAreaInsetsDidChangeSubject: PublishSubject<Void> {
        guard let subject = objc_getAssociatedObject(self, &AssociatedSubjectKey.viewSafeAreaInsetsDidChange) else {
            let subject = PublishSubject<Void>()
            objc_setAssociatedObject(self, &AssociatedSubjectKey.viewSafeAreaInsetsDidChange, subject, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            return subject
        }
        return subject as! PublishSubject<Void>
    }
    
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
