//
//  GuideViewController.swift
//  MVVMC
//
//  Created by sam on 2023/10/9.
//

import UIKit
import RxSwift

class GuideViewController<VM: GuideViewModel>: NiblessViewController, ViewModelOwnerInitializable {
    
//    var viewModel: GuideViewModel
//    
//    required init(_ viewModel: GuideViewModel) {
//        self.viewModel = viewModel
//        super.init()
//        title = "Guide"
//    }
    
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
            .bind(to: viewModel.runAppSubject)
            .disposed(by: disposeBag)
    }
    
    private lazy var button = UIButton(type: .custom).then {
        $0.setTitle("Go", for: .normal)
        $0.titleLabel?.font = UIFont.scale(30.0, .iPhone_6s)
        $0.setBackgroundImage(UIImage.color(.yellow), for: .normal)
        $0.setTitleColor(.blue, for: .normal)
    }
}
