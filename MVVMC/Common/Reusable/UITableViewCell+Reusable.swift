//
//  UITableView+Reusable.swift
//  MVVMC
//
//  Created by sam on 2023/10/30.
//

import UIKit

extension UITableViewCell: Reusable {}

public extension UITableViewCell {
    
    static func cellFor(_ tableView: UITableView) -> Self {
        var cell = tableView.dequeueReusableCell(withIdentifier: Self.reuseIdentifier)
        if cell == nil {
            cell = Self.init(style: .default, reuseIdentifier: Self.reuseIdentifier)
        }
        return cell as! Self
    }
}
