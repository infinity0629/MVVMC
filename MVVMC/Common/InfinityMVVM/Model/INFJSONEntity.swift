//
//  INFJSONEntity.swift
//  MVVMC
//
//  Created by sam on 2023/10/27.
//

import Foundation
import SwiftyJSON

public protocol INFJSONEntity: INFEntity {
    init?(_ json: JSON)
}
