//
//  ProductCoordinator.swift
//  MVVMC
//
//  Created by sam on 2023/10/9.
//

import UIKit

final class ProductCoordinator: Coordinator {
    
    override var startViewController: UIViewController {
        ProductViewController(ProductViewModelImpl())
    }
}
