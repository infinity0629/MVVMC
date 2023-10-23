//
//  ProductViewController.swift
//  MVVMC
//
//  Created by sam on 2023/10/9.
//

import UIKit
import InfinityUIKit

class ProductViewController: NiblessViewController, View {

    var viewModel: ProductViewModel
    
    required init(_ viewModel: ProductViewModel) {
        self.viewModel = viewModel
        super.init()
        title = "Product"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
}
