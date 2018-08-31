//
//  WalletCoin.swift
//  FoxOne
//
//  Created by moubuns on 2018/8/25.
//  Copyright © 2018 FoxOne. All rights reserved.
//

import Foundation

public struct WalletCoin: Codable {
    public let id: Int
    public let logo: String
    public let mixinAssetId: String
    public let symbol: String
    public let name: String
}
