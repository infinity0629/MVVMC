//
//  INFCollectionViewCell.swift
//  MVVMC
//
//  Created by sam on 2023/10/29.
//

import UIKit
import RxSwift
import RxCocoa

open class INFCollectionViewCell: NiblessCollectionViewCell {
    
    public var disposeBag = DisposeBag()
    
    public override init(frame: CGRect) {
        super.init(frame: .zero)
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
    
    open func setBinding(with viewModel: INFCellViewModel) {
        fatalError("\(#function) has not been overrided")
    }
}

extension UICollectionViewCell: Reusable {}
