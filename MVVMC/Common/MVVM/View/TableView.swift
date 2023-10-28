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
    
    public func dequeueReusableCell<C: Cell, VM: CellViewModel>(viewModel: VM, forIndexPath indexPath: IndexPath) -> C where C.VM == VM {
        let cell = dequeueReusableCell(withIdentifier: C.reuseIdentifier, for: indexPath) as! C
        cell.setBinding(with: viewModel)
        return cell
    }
}
