//
//  AccountViewController.swift
//  MVVMC
//
//  Created by sam on 2023/10/8.
//

import UIKit
import RxSwift
import RxCocoa

protocol AccountViewControllerDelegate: AnyObject {
    func accountViewControllerGuideButtonPressed(_ viewController: AccountViewController)
}

final class AccountViewController: NiblessViewController, View {
    
    var viewModel: AccountViewModel
    
    var disposeBag = DisposeBag()
    
    weak var delegate: AccountViewControllerDelegate?
    
    
    init(_ viewModel: AccountViewModel) {
        self.viewModel = viewModel
        super.init()
        title = "Account"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let button = UIButton(type: .custom)
        button.setTitle("Guide", for: .normal)
        button.setBackgroundImage(UIImage.color(.yellow), for: .normal)
        button.setTitleColor(.blue, for: .normal)
        view.addSubview(button)
        
        button.snp.makeConstraints { make in
            make.center.equalTo(view)
            make.width.equalTo(100)
            make.height.equalTo(50)
        }
        
        button.rx.tap.subscribe(onNext: { [weak self] in
            guard let self else { return }
            delegate?.accountViewControllerGuideButtonPressed(self)
        }).disposed(by: disposeBag)
    }
}
