//
//  Asset.swift
//  FoxOne
//
//  Created by moubuns on 2018/6/26.
//  Copyright © 2018 FoxOne. All rights reserved.
//

import Foundation

/// 资产
public struct Asset: Codable {
    public let id: String
    public let balance: Double
    public let chainId: String
    public let coinId: Int
    public let confirmations: Double
    public let icon: String
    public let name: String
    public let priceBTC: Double
    public let priceUSD: Double
    public let publicKey: String
    public let symbol: String
    public let changeBtcPercentage: Double
    public let changeUsdPercentage: Double
    public let accountName: String
    public let accountTag: String
    public let chain: WalletCoin?
    public let coin: WalletCoin?

    public var userUSDAsset: Double {
        return priceUSD * balance
    }

    public var userBTCAsset: Double {
        return priceBTC * balance
    }

    public var oldPrices: Double {
        if self.changeUsdPercentage == -1.0 {
            return self.priceUSD
        }
        return self.priceUSD / (1.0 + self.changeUsdPercentage)
    }
}
