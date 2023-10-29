//
//  TableView.swift
//  MVVMC
//
//  Created by sam on 2023/10/28.
//

import UIKit

public protocol TableView: View where VM: TableViewModel {
    var tableView: UITableView { get }
}

extension UITableView {
    
//    public func dequeueReusableCell<C: Cell, VM: CellViewModel>(viewModel: VM, forIndexPath indexPath: IndexPath) -> C where C.VM == VM {
//        let cell = dequeueReusableCell(withIdentifier: C.reuseIdentifier, for: indexPath) as! C
//        cell.setBinding(with: viewModel)
//        return cell
//    }
//    
//    public func dequeueReusableCell<C: Cell, VM: CellViewModel>(viewModel: VM, forRow row: Int) -> C where C.VM == VM {
//        dequeueReusableCell(viewModel: viewModel, forIndexPath: IndexPath(row: row, section: 0))
//    }
//    
//    public func dequeueReusableCell<C: Cell, VM: CellViewModel>(cell: C.Type, viewModel: VM) -> C where C.VM == VM {
//        let cell = dequeueReusableCell(withIdentifier: C.reuseIdentifier) as! C
//        cell.setBinding(with: viewModel)
//        return cell
//    }
}
