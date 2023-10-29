//
//  INFTableViewCell.swift
//  MVVMC
//
//  Created by sam on 2023/10/29.
//

import UIKit
import RxSwift
import RxCocoa

open class INFTableViewCell<VM: INFCellViewModel>: NiblessTableViewCell {
    
    public var disposeBag = DisposeBag()
    
    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: Self.reuseIdentifier)
        setLayout()
        setConstraint()
    }
    
    open override func prepareForReuse() {
        super.prepareForReuse()
        disposeBag = DisposeBag()
    }
    
    open func setLayout() {
        fatalError("\(#function) has not been overrided")
    }
    
    open func setConstraint() {
        fatalError("\(#function) has not been overrided")
    }
    
    open func setBinding(with viewModel: VM) {
        fatalError("\(#function) has not been overrided")
    }
}

extension UITableViewCell: Reusable {}
