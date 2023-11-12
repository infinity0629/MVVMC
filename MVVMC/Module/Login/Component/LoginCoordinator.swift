//
//  LoginCoordinator.swift
//  MVVMC
//
//  Created by sam on 2023/11/1.
//

import UIKit

final class LoginCoordinator: Coordinator {
    
    override var startViewController: UIViewController {
        LoginViewController(LoginViewModelImpl())
    }
}
