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
    case snapshots(cursor: String, limit: Int)
    case snapshot(id: String)
    case withdraw(id: String, address: String, amount: String, memo: String, label: String)
    case fee(id: String, address: String, label: String)
    case supportAssets
    case setPin(newPinToken: String, type: Int)
    case changePin(oldPinToken: String, newPinToken: String, type: Int)
    case validatePin(pinToken: String)
    case hideAsset(id: String)
    case showAsset(id: String)

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
        case .supportAssets:
            return "/wallet/assets"
        case .changePin:
            return "/account/pin"
        case .setPin:
            return "/account/pin"
        case .validatePin:
            return "/account/pin-verify"
        case .hideAsset:
            return "/wallet/asset/hide"
        case .showAsset:
            return "/wallet/asset/hide"
        }
    }

    var method: HTTPMethod {
        switch self {
        case .withdraw, .hideAsset:
            return .post
        case .setPin, .validatePin, .changePin:
            return .put
        case .showAsset:
            return .delete
        default:
            return .get
        }
    }

    var parameters: Parameters? {
        switch self {
        case .snapshots(let cursor, let limit):
            return ["cursor": cursor,"limit": limit]
        case .snapshot(let id):
            return ["assetId": id]
        case .withdraw(let id, let address, let amount, let memo, let label):
            var param: [String: Any] = ["publicKey": address, "amount": amount, "assetId": id, "memo": memo]
            if !label.isEmpty {
                param["label"] = label
            }
            return param
        case .fee(let id, let address, let label):
            var param: [String: Any] = ["assetId": id, "publicKey": address, "label": label]
            if !label.isEmpty {
                param["label"] = label
            }
            return param
        case .supportAssets:
            return ["entirechain": "1"]
        case .setPin(let newPinToken, let type):
            return ["pinType": type, "newPinToken": newPinToken]
        case .changePin(_, let newPinToken, let type):
            return ["pinType": type, "newPinToken": newPinToken]
        case .showAsset(let id), .hideAsset(let id):
            return ["id": id]
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
            return [foxCustomPinHeader: pinToken]
        case .validatePin(let pinToken):
            return [foxCustomPinHeader: pinToken]
        default:
            guard let pin = OpenSDK.shared.delegate?.f1PIN() else {
                return nil
            }
            return [foxCustomPinHeader: PinHelper.generatePinToken(with: pin)]
        }
    }

    var url: String {
        return OpenSDK.shared.baseURL + self.path
    }
}
