//
//  ProductViewController.swift
//  MVVMC
//
//  Created by sam on 2023/10/9.
//

import UIKit

class ProductViewController<VM: ProductViewModel>: NiblessViewController, View  {

    var viewModel: VM
    
    required init(_ viewModel: VM) {
        self.viewModel = viewModel
        super.init()
        title = "Product"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
}
