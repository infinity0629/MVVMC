//
//  HomeViewController.swift
//  MVVMC
//
//  Created by sam on 2023/10/6.
//

import UIKit
import InfinityUIKit
import SnapKit
import RxSwift
import RxCocoa

protocol HomeViewControllerDelegate: AnyObject {
    func homeViewControllerDidSelectedLeftBarButtonItem(_ viewController: HomeViewController)
    func homeViewControllerDidSelectedRightBarButtonItem(_ viewController: HomeViewController)
}

final class HomeViewController: NiblessViewController, View {
    
    var viewModel: HomeViewModel
    weak var delegate: HomeViewControllerDelegate?
    
    let disposeBag = DisposeBag()
    
    init(_ viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init()
        title = "Home"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        let leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: nil, action: nil)
        leftBarButtonItem.rx.tap.subscribe(onNext: { [weak self] in
            guard let self else { return }
            delegate?.homeViewControllerDidSelectedLeftBarButtonItem(self)
        }).disposed(by: disposeBag)
        navigationItem.leftBarButtonItem = leftBarButtonItem
        
        let rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: nil, action: nil)
        rightBarButtonItem.rx.tap.subscribe(onNext: { [weak self] in
            guard let self else { return }
            delegate?.homeViewControllerDidSelectedRightBarButtonItem(self)
        }).disposed(by: disposeBag)
        navigationItem.rightBarButtonItem = rightBarButtonItem
    }
}
