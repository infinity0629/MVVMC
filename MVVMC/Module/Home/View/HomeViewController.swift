//
//  HomeViewController.swift
//  MVVMC
//
//  Created by sam on 2023/10/6.
//

import UIKit

final class HomeViewController: NiblessViewController, View {
    
    var viewModel: HomeViewModel
    
    init(_ viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
}
