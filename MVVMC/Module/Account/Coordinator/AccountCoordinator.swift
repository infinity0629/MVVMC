//
//  AccountCoordinator.swift
//  MVVMC
//
//  Created by sam on 2023/10/8.
//

import UIKit
import RxSwift
import Then

final class AccountCoordinator: Coordinator {
    
    private var disposeBag = DisposeBag()

    override var startViewController: UIViewController {
        AccountViewController(AccountViewModel(AccountModel())).then {
            $0.viewModel.guideSubject
                .subscribe(onNext:  {
                    AppDelegate.shared.setCoordinator(.guide)
                })
                .disposed(by: disposeBag)
        }
    }
}
