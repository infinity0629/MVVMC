//
//  HomeViewController.swift
//  MVVMC
//
//  Created by sam on 2023/10/6.
//

import UIKit
import RxSwift
import RxCocoa

final class HomeViewController<VM: HomeViewModel>: NiblessViewController, ViewModelOwnerInitializable {
    
    var viewModel: VM
    
    init(_ viewModel: VM) {
        self.viewModel = viewModel
        super.init()
        title = "Home"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        let leftBarButtonItem = UIBarButtonItem(title: "Login", style: .plain, target: nil, action: nil)
        leftBarButtonItem.rx.tap
            .bind(to: viewModel.accountSubject)
            .disposed(by: disposeBag)
        navigationItem.leftBarButtonItem = leftBarButtonItem
        
        let rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: nil, action: nil)
        rightBarButtonItem.rx.tap
            .bind(to: viewModel.settingSubject)
            .disposed(by: disposeBag)
        navigationItem.rightBarButtonItem = rightBarButtonItem
    }
}
