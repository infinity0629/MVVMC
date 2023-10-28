//
//  CollectionView.swift
//  MVVMC
//
//  Created by sam on 2023/10/28.
//

import UIKit

public protocol CollectionView: View where VM: CollectionViewModel {
    var collectionView: UICollectionView { get }
}

extension UICollectionView {
    
    public func dequeueReusableCell<C: Cell, VM: CellViewModel>(viewModel: VM, forIndexPath indexPath: IndexPath) -> C where C.VM == VM {
        let cell = dequeueReusableCell(withReuseIdentifier: C.reuseIdentifier, for: indexPath) as! C
        cell.setBinding(with: viewModel)
        return cell
    }
}
