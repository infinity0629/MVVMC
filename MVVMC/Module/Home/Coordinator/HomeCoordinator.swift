//
//  HomeCoordinator.swift
//  MVVMC
//
//  Created by sam on 2023/10/7.
//

import UIKit
import InfinityUIKit

final class HomeCoordinator: Coordinator {

    override var startViewController: UIViewController {
        HomeViewController(HomeViewModelImpl(HomeModelImpl()))
    }
}
