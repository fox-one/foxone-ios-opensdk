//
//  Fee.swift
//  FoxOne
//
//  Created by moubuns on 2018/8/28.
//  Copyright © 2018 FoxOne. All rights reserved.
//

import Foundation

public struct Fee: Codable {
    public let coinId: Int
    public let amount: Double
    public let assetId: String
}
