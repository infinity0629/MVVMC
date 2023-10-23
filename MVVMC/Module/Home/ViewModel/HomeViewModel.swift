//
//  HomeViewModel.swift
//  MVVMC
//
//  Created by sam on 2023/10/23.
//

import InfinityUIKit
import RxSwift

protocol HomeViewModel: ViewModel {
    
    var accountSubject: PublishSubject<Void> { get }
    
    var settingSubject: PublishSubject<Void> { get }
}
