//
//  SnapshotList.swift
//  FoxOne
//
//  Created by moubuns on 2018/6/26.
//  Copyright © 2018 FoxOne. All rights reserved.
//

import Foundation
import SwiftyJSON

class Lists<T: OpenSDKMappable> {
    let items: [T]
    let pagination: PagInation

    required init?(jsonData: JSON, key: String) {
        self.items = jsonData[key].arrayValue.compactMap {
            T(jsonData: $0)
        }
        self.pagination = PagInation(jsonData: jsonData["pagination"]) ?? PagInation()
    }
}
