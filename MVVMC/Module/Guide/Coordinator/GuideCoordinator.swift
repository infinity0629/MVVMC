//
//  GuideCoordinator.swift
//  MVVMC
//
//  Created by sam on 2023/10/9.
//

import UIKit
import InfinityUIKit

final class GuideCoordinator: Coordinator {
    
    override var startViewController: UIViewController {
        GuideViewController(GuideViewModel(GuideModel()))
    }
}
