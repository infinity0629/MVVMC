//
//  GuideCoordinator.swift
//  MVVMC
//
//  Created by sam on 2023/10/9.
//

import UIKit
import RxSwift

final class GuideCoordinator: Coordinator {
    
    var router: Router
    
    init(router: Router) {
        self.router = router
    }
    
    var startViewController: UIViewController {
        GuideViewController(GuideViewModel(GuideModel())).then {
            $0.viewModel.runAppSubject
                .subscribe(onNext:  {
                    AppDelegate.shared.setCoordinator(.main)
                })
                .disposed(by: disposeBag)
        }
    }
}
