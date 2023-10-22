//
//  SettingComponent.swift
//  MVVMC
//
//  Created by sam on 2023/10/8.
//

import UIKit
import InfinityUIKit

final class SettingComponent: Coordinator {

    override var startViewController: UIViewController {
        SettingViewController(SettingViewModel(SettingModel()))
    }
}
