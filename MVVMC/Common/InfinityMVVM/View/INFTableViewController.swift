//
//  INFTableViewController.swift
//  MVVMC
//
//  Created by sam on 2023/10/29.
//

import UIKit
import Then

open class INFTableViewController<VM: INFListViewModel>: INFViewController<VM> {
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.edges.equalTo(view)
        }
        setLayout()
        setConstraint()
        setBinding()
    }

    open override func setLayout() {
        fatalError("\(#function) has not been overrided")
    }
    
    open override func setConstraint() {
        fatalError("\(#function) has not been overrided")
    }
    
    open override func setBinding() {
        fatalError("\(#function) has not been overrided")
    }
    
    open func tableViewStyle() -> UITableView.Style {
        .plain
    }
    
    public lazy var tableView = UITableView(frame: .zero, style: tableViewStyle()).then {
        $0.backgroundColor = .clear
        $0.showsVerticalScrollIndicator = false
        $0.contentInsetAdjustmentBehavior = .never
    }
}

public extension UITableView {
    
    func dequeueReusableCell<C: INFTableViewCell<INFCellViewModel>, VM: INFCellViewModel>(cell: C.Type, viewModel: VM) -> C {
        let cell = dequeueReusableCell(withIdentifier: C.reuseIdentifier) as! C
        cell.setBinding(with: viewModel)
        return cell
    }
    
//    func dequeueReusableCell<C: INFTableViewCell<INFCellViewModel>, VM: INFCellViewModel>(viewModel: VM, forIndexPath indexPath: IndexPath) -> C {
//        let cell = dequeueReusableCell(withIdentifier: C.reuseIdentifier, for: indexPath) as! C
//        cell.setBinding(with: viewModel)
//        return cell
//    }
//    
//    func dequeueReusableCell<C: INFTableViewCell<INFCellViewModel>, VM: INFCellViewModel>(viewModel: VM, forRow row: Int) -> C {
//        dequeueReusableCell(viewModel: viewModel, forIndexPath: IndexPath(row: row, section: 0))
//    }
}
