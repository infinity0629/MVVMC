//
//  MainViewController.swift
//  MVVMC
//
//  Created by sam on 2023/10/9.
//

import UIKit

class MainViewController<VM: MainViewModel>: NiblessViewController, View  {
    
    var viewModel: VM
    
    private(set) lazy var childController = UITabBarController()
    
    required init(_ viewModel: VM) {
        self.viewModel = viewModel
        super.init()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Main"
        setupLayout()
    }
    
    private func setupLayout() {
        addChild(childController)
        view.addSubview(childController.view)
        childController.didMove(toParent: self)
    }
}
