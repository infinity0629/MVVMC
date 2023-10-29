//
//  INFCollectionViewController.swift
//  MVVMC
//
//  Created by sam on 2023/10/29.
//

import UIKit
import Then

open class INFCollectionViewController<VM: INFListViewModel>: INFViewController<VM> {
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints {
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
    
    open func collectionViewLayout() -> UICollectionViewLayout {
        UICollectionViewLayout()
    }
    
    public lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: 
                                                        collectionViewLayout()).then {
        $0.backgroundColor = .clear
        $0.showsVerticalScrollIndicator = false
        $0.contentInsetAdjustmentBehavior = .never
    }
}
