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

final class AccountViewController<VM: AccountViewModel>: NiblessViewController, ViewModelOwnerInitializable {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setBinding()
    }
    
    private func setBinding() {
        button.rx.tap
            .bind(to: viewModel.guideSubject)
            .disposed(by: disposeBag)
    }
    
    private lazy var button: UIButton = {
        let button = UIButton(type: .custom).then {
            $0.setTitle("Guide", for: .normal)
            $0.titleLabel?.font = UIFont.scale(30.0, .iPhone_6s)
            $0.setBackgroundImage(UIImage.color(.yellow), for: .normal)
            $0.setTitleColor(.blue, for: .normal)
        }
        view.addSubview(button)
        button.snp.makeConstraints {
            $0.center.equalTo(view)
            $0.width.equalTo(100.0.scale(.iPhone_6s))
            $0.height.equalTo(50.0.scale(.iPhone_6s))
        }
        return button
    }()
}
