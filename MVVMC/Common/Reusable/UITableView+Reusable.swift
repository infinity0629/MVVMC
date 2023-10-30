//
//  UITableView+Reusable.swift
//  MVVMC
//
//  Created by sam on 2023/10/30.
//

import UIKit

public extension UITableView {
    
    func register<C: UITableViewCell>(cellClass: C.Type) {
        register(C.self, forCellReuseIdentifier: C.reuseIdentifier)
    }
    
    func dequeueReusableCell<C: UITableViewCell>(cell: C.Type) -> C {
        dequeueReusableCell(withIdentifier: C.reuseIdentifier) as! C
    }
    
    func dequeueReusableCell<C: UITableViewCell>(for indexPath: IndexPath) -> C {
        dequeueReusableCell(withIdentifier: C.reuseIdentifier, for: indexPath) as! C
    }

    func dequeueReusableCell<C: UITableViewCell>(for row: Int) -> C {
        dequeueReusableCell(for: IndexPath(row: row, section: 0))
    }
}
