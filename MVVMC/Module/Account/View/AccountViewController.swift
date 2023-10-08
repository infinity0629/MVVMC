//
//  AccountViewController.swift
//  MVVMC
//
//  Created by sam on 2023/10/8.
//

import UIKit

final class AccountViewController: NiblessViewController, View {
    
    var viewModel: AccountViewModel
    
    init(_ viewModel: AccountViewModel) {
        self.viewModel = viewModel
        super.init()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Account"
    }
}
