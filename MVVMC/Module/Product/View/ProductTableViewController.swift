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
    
    var viewModel: VM

    init(_ viewModel: VM) {
        self.viewModel = viewModel
        super.init()
        title = viewModel.title
        setLifecycleBinding()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
        setConstraint()
        setBinding()
        print("VC \(#function)")
    }
    
    func setLayout() {
        view.addSubview(tableView)
    }
    
    func setConstraint() {
        tableView.snp.makeConstraints {
            $0.edges.equalTo(view).inset(UIEdgeInsets(top: 84, left: 0, bottom: 0, right: 0))
        }
    }
    
    func setBinding() {
        viewModel.cellViewModels
            .bind(to: tableView.rx.items) { (tableView, row, cellViewModel) in
                ProductTableViewCell.cellFor(tableView).then {
                   $0.setBinding(with: cellViewModel as! (any ProductCellViewModel))
                }
            }
            .disposed(by: disposeBag)
    }
    
    lazy var tableView = UITableView(frame: .zero, style: .plain).then {
        $0.backgroundColor = .clear
        $0.showsVerticalScrollIndicator = false
        $0.contentInsetAdjustmentBehavior = .never
    }
}
