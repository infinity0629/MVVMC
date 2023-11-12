//
//  ProductTableViewController.swift
//  MVVMC
//
//  Created by sam on 2023/10/9.
//

import UIKit
import RxSwift
import RxCocoa
import Then
                              
final class ProductTableViewController<VM: ProductViewModel>: NiblessViewController, ViewModelOwnerInitializable  {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBinding()
    }
    
    func setBinding() {
        
        tableView.pullDownRefresh {
            
        }
        
        tableView.pullUpLoadMore {
            
        }
        
        viewModel.cellViewModels
            .bind(to: tableView.rx.items) { (tableView, row, cellViewModel) in
                ProductTableViewCell.cellFor(tableView).then {
                   $0.setContent(with: cellViewModel as! (any ProductCellViewModel))
                }
            }
            .disposed(by: disposeBag)
    }
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain).then {
            $0.backgroundColor = .clear
            $0.showsVerticalScrollIndicator = false
            $0.contentInsetAdjustmentBehavior = .never
        }
        view.addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.left.right.equalTo(view)
            $0.top.equalTo(view).offset(UIApplication.navigationFullHeight)
            $0.bottom.equalTo(view).offset(-UIApplication.tabBarFullHeight)
        }
        return tableView
    }()
}
