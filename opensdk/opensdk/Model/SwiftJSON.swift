//
//  SwiftJSON.swift
//  FoxOne
//
//  Created by moubuns on 2018/8/30.
//  Copyright © 2018 FoxOne. All rights reserved.
//

import Foundation
import SwiftyJSON

internal protocol OpenSDKMappable {
    init?(jsonData: JSON)
}

extension WalletCoin: OpenSDKMappable {
    init?(jsonData: JSON) {
        id = jsonData["coinId"].intValue
        name = jsonData["name"].stringValue
        symbol = jsonData["symbol"].stringValue
        logo = jsonData["logo"].stringValue
        mixinAssetId = jsonData["mixinAssetId"].stringValue
    }
}

extension Snapshot: OpenSDKMappable {
    public init?(jsonData: JSON) {
        amount = jsonData["amount"].doubleValue
        assetId = jsonData["assetId"].stringValue
        coinId = jsonData["coinId"].intValue
        counterUserId = jsonData["counterUserId"].stringValue
        insideMixin = jsonData["insideMixin"].boolValue
        createdAt = jsonData["createdAt"].intValue
        memo = jsonData["memo"].stringValue
        snapshotId = jsonData["snapshotId"].stringValue
        traceId = jsonData["traceId"].stringValue
        transactionHash = jsonData["transactionHash"].stringValue
    }
}

extension Fee: OpenSDKMappable {
    init?(jsonData: JSON) {
        amount = jsonData["amount"].doubleValue
        assetId = jsonData["assetId"].stringValue
        coinId = jsonData["coinId"].intValue
    }
}

extension Asset: OpenSDKMappable {
    init?(jsonData: JSON) {
        id = jsonData["assetId"].stringValue
        balance = jsonData["balance"].doubleValue
        chainId = jsonData["chainId"].stringValue
        changeBtcPercentage = jsonData["changeBtc"].doubleValue
        changeUsdPercentage = jsonData["changeUsd"].doubleValue
        coinId = jsonData["coinId"].intValue
        confirmations = jsonData["confirmations"].doubleValue
        icon = jsonData["icon"].stringValue
        name = jsonData["name"].stringValue
        priceBTC = jsonData["priceBtc"].doubleValue
        priceUSD = jsonData["priceUsd"].doubleValue
        publicKey = jsonData["publicKey"].stringValue
        symbol = jsonData["symbol"].stringValue
        accountName = jsonData["accountName"].stringValue
        accountTag = jsonData["accountTag"].stringValue
        chain = WalletCoin(jsonData: jsonData["chain"])
        coin = WalletCoin(jsonData: jsonData["coin"])
        option = Option(jsonData: jsonData["option"]) ?? Option(hide: false)
    }
}

extension Option: OpenSDKMappable {
    init?(jsonData: JSON) {
        hide = jsonData["hide"].boolValue
    }
}
