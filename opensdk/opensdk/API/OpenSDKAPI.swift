//
//  OpenSDKAPI.swift
//  opensdk
//
//  Created by moubuns on 2018/8/31.
//  Copyright © 2018 FoxOne. All rights reserved.
//

import Foundation
import Alamofire

enum OpenSDKAPI {
    case assets
    case asset(id: String)
    case snapshots
    case snapshot(id: String)
    case withdraw(id: String, address: String, amount: String, memo: String, label: String)
    case fee(id: String, address: String, label: String)
    case walletAssets
    case setPin(newPinToken: String, type: Int)
    case changePin(oldPinToken: String, newPinToken: String, type: Int)
    case validatePin(pinToken: String)

    var path: String {
        switch self {
        case .assets:
            return "/wallet/assets"
        case .asset(let assetId):
            return "/wallet/assets/\(assetId)"
        case .snapshots:
            return "/wallet/snapshots"
        case .snapshot:
            return "/wallet/snapshots"
        case .withdraw:
            return "/wallet/withdraw"
        case .fee:
            return "/wallet/withdraw/fee"
        case .walletAssets:
            return "/market/coin/wallet-assets"
        case .changePin:
            return "/account/pin"
        case .setPin:
            return "/account/pin"
        case .validatePin:
            return "/account/pin-verify"
        }
    }

    var method: HTTPMethod {
        switch self {
        case .withdraw:
            return .post
        case .setPin, .validatePin, .changePin:
            return .put
        default:
            return .get
        }
    }

    var parameters: Parameters? {
        switch self {
        case .snapshot(let assetId):
            return ["assetId": assetId]
        case .withdraw(let publicKey, let amount, let memo, let assetId, let label):
            var param: [String: Any] = ["publicKey": publicKey, "amount": amount, "assetId": assetId, "memo": memo]
            if !label.isEmpty {
                param["label"] = label
            }
            return param
        case .fee(let assetId, let publicKey, let label):
            var param: [String: Any] = ["assetId": assetId, "publicKey": publicKey, "label": label]
            if !label.isEmpty {
                param["label"] = label
            }
            return param
        case .setPin(let newPinToken, let type):
            return ["pinType": type, "newPinToken": newPinToken]
        case .changePin(_, let newPinToken, let type):
            return ["pinType": type, "newPinToken": newPinToken]
        default:
            return nil
        }
    }

    var parameterEncoding: ParameterEncoding {
        switch self.method {
        case .get:
            return URLEncoding.default
        default:
            return JSONEncoding.default
        }
    }

    var headers: [String: String]? {
        switch self {
        case .changePin(let pinToken, _, _):
            return ["fox-client-pin": pinToken]
        case .validatePin(let pinToken):
            return ["fox-client-pin": pinToken]
        default:
            return ["fox-client-pin": "PinManager.shared.rasToken"]

        }
    }

    var url: String {
        return OpenSDK.shared.baseURL + self.path
    }
}
