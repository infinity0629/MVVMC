//
//  MainViewController.swift
//  MVVMC
//
//  Created by sam on 2023/10/9.
//

import UIKit

class MainViewController<VM: MainViewModel>: NiblessTabBarController, View  {
    
    var viewModel: VM
    
    required init(_ viewModel: VM) {
        self.viewModel = viewModel
        super.init()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Main"
    }
}
