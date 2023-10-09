//
//  AccountCoordinator.swift
//  MVVMC
//
//  Created by sam on 2023/10/8.
//

import UIKit

final class AccountCoordinator: Coordinator {

    override var startViewController: UIViewController {
        AccountViewController(AccountViewModel(AccountModel()))
    }
}
