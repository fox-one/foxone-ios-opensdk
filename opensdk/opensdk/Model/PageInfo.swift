//
//  PagInation.swift
//  FoxOneOpenSDK
//
//  Created by 杜一平 on 2018/9/22.
//  Copyright © 2018 FoxOne. All rights reserved.
//

import UIKit
import SwiftyJSON

public struct PageInfo: OpenSDKMappable {
    
    let nextCursor: String
    let hasNext: Bool
    
    init?(jsonData: JSON) {
        nextCursor = jsonData["nextCursor"].stringValue
        hasNext = jsonData["hasNext"].boolValue
    }
    
    init() {
        nextCursor = ""
        hasNext = false
    }
}
