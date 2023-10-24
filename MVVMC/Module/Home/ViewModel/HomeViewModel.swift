//
//  HomeViewModel.swift
//  MVVMC
//
//  Created by sam on 2023/10/23.
//

import Foundation
import RxSwift

protocol HomeViewModel: ViewModel {
    
    var accountSubject: PublishSubject<Void> { get }
    
    var settingSubject: PublishSubject<Void> { get }
}
