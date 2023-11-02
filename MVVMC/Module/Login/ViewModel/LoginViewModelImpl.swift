//
//  LoginViewModelImpl.swift
//  MVVMC
//
//  Created by sam on 2023/11/1.
//

import Foundation
import RxSwift
import RxRelay

final class LoginViewModelImpl: LoginViewModel {
    
    let cellViewModels = BehaviorRelay<[any LoginCellViewModel]>(value: [])
    
    init() {
        setBinding()
    }
    
    private func setBinding() {
        cellViewModels.accept([
            CellDataEntity(title: "账号", placeholder: "输入您的账号", tips: "至少5个字符"),
            CellDataEntity(title: "密码", placeholder: "输入您的密码", tips: "至少5个字符")
        ].map {
            LoginCellViewModelImpl($0)
        })
    }
}
