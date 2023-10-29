//
//  NiblessCollectionViewCell.swift
//  MVVMC
//
//  Created by sam on 2023/10/29.
//

import UIKit

open class NiblessCollectionViewCell: UICollectionViewCell {
 
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    @available(*, unavailable, message: "Loading this view from a nib is unsupported in favor of initializer dependency injection.")
    public required init?(coder aDecoder: NSCoder) {
        fatalError("Loading this view from a nib is unsupported in favor of initializer dependency injection.")
    }
}
