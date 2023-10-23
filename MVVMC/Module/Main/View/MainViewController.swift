//
//  MainViewController.swift
//  MVVMC
//
//  Created by sam on 2023/10/9.
//

import UIKit
import InfinityUIKit

class MainViewController: NiblessTabBarController  {
    
    var viewModel: MainViewModel
    
    required init(_ viewModel: MainViewModel) {
        self.viewModel = viewModel
        super.init()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Main"
    }
}

extension MainViewController: View {}
