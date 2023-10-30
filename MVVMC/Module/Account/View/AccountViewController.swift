//
//  AccountViewController.swift
//  MVVMC
//
//  Created by sam on 2023/10/8.
//

import UIKit
import SnapKit
import Then
import RxSwift
import RxCocoa

final class AccountViewController: NiblessViewController, ViewModelOwnerInitializable {
    
    var viewModel: AccountViewModel
    
    init(_ viewModel: AccountViewModel) {
        self.viewModel = viewModel
        super.init()
        title = "Account"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setLayout()
        setConstraint()
        setBinding()
    }
    
    private func setLayout() {
        view.addSubview(button)
    }
    
    private func setConstraint() {
        button.snp.makeConstraints {
            $0.center.equalTo(view)
            $0.width.equalTo(100.0.scale(.iPhone_6s))
            $0.height.equalTo(50.0.scale(.iPhone_6s))
        }
    }
    
    private func setBinding() {
        button.rx.tap
            .bind(to: viewModel.guideSubject)
            .disposed(by: disposeBag)
    }
    
    private lazy var button = UIButton(type: .custom).then {
        $0.setTitle("Guide", for: .normal)
        $0.titleLabel?.font = UIFont.scale(30.0, .iPhone_6s)
        $0.setBackgroundImage(UIImage.color(.yellow), for: .normal)
        $0.setTitleColor(.blue, for: .normal)
    }
}
