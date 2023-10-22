//
//  GuideViewController.swift
//  MVVMC
//
//  Created by sam on 2023/10/9.
//

import UIKit
import InfinityUIKit

class GuideViewController: NiblessViewController, View {
    
    var viewModel: GuideViewModel
    
    required init(_ viewModel: GuideViewModel) {
        self.viewModel = viewModel
        super.init()
        title = "Guide"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
}
