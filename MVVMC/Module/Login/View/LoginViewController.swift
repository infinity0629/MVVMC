//
//  LoginViewController.swift
//  MVVMC
//
//  Created by sam on 2023/11/1.
//

import UIKit
import RxSwift
import RxCocoa
import Then

final class LoginViewController<VM: LoginViewModel>: NiblessViewController, ViewModelOwnerInitializable {
    
    var viewModel: VM
    
    init(_ viewModel: VM) {
        self.viewModel = viewModel
        super.init()
        setLifecycleBinding()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
        setConstraint()
        setBinding()
    }
    
    private func setLayout() {
        
        title = "Login"
        
        view.backgroundColor = .white
        
        tableView.rowHeight = 80.scale(.iPhone_6s)
        tableView.tableFooterView = loginButton
        view.addSubview(tableView)
    }
    
    private func setConstraint() {
        tableView.snp.makeConstraints {
            $0.left.right.equalTo(view)
            $0.top.equalTo(view).offset(UIApplication.navigationFullHeight)
            $0.bottom.equalTo(view).offset(-UIApplication.tabBarFullHeight)
        }
    }
    
    private func setBinding() {
        viewModel.cellViewModels
            .bind(to: tableView.rx.items) { (tableView, row, cellViewModel) in
                LoginCell.cellFor(tableView).then {
                   $0.setContent(with: cellViewModel as! (any LoginCellViewModel))
                }
            }
            .disposed(by: disposeBag)
    }
    
    lazy var tableView = UITableView(frame: .zero, style: .plain).then {
        $0.backgroundColor = .clear
        $0.showsVerticalScrollIndicator = false
        $0.contentInsetAdjustmentBehavior = .never
        $0.separatorColor = .clear
        $0.separatorStyle = .none
    }
    
    lazy var loginButton = UIButton().then {
        $0.frame = CGRect(x: 10.0, y: 0.0, width: UIScreen.main.bounds.width - 20, height: 80)
        $0.setBackgroundImage(UIImage.color(.clear), for: .normal)
        $0.setTitleColor(.blue, for: .normal)
        $0.titleLabel?.font = UIFont.scale(20.0, .iPhone_6s)
        $0.setTitle("登录", for: .normal)
    }
}
