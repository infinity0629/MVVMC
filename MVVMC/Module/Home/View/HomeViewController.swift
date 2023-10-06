//
//  HomeViewController.swift
//  MVVMC
//
//  Created by sam on 2023/10/6.
//

import UIKit

final class HomeViewController: UIViewController, View {
    
    var viewModel: HomeViewModel
    
    init(_ viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
