//
//  INFCellViewModel.swift
//  MVVMC
//
//  Created by sam on 2023/10/29.
//

import UIKit

open class INFCellViewModel: NSObject {
    
    public let entity: INFEntity
    
    public init(_ entity: INFEntity) {
        self.entity = entity
    }
}
