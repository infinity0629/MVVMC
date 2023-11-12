//
//  MainViewController.swift
//  MVVMC
//
//  Created by sam on 2023/10/9.
//

import UIKit
import SwifterSwift

class MainViewController<VM: MainViewModel>: NiblessViewController, ViewModelOwnerInitializable  {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
    
    private(set) lazy var childController: UITabBarController = {
        UITabBarController()
            .then {
                addChildViewController($0, toContainerView: view)
            }
    }()
}
