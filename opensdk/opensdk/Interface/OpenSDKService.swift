//
//  WalletService.swift
//  FoxOne
//
//  Created by moubuns on 2018/6/26.
//  Copyright © 2018 FoxOne. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire

public final class OpenSDKService {

    /// 获取所有资产的列表
    /// （必须在OPENSDK的接口中传入PIN）
    ///
    /// - Parameter completion: 结果回调，所有资产或者错误
    /// - Returns: 返回请求体
    @discardableResult
    public class func getAssets(completion: @escaping (Result<[Asset]>) -> Void) -> DataRequest {
        return NetworkManager.shared.request(api: OpenSDKAPI.assets)
            .responseData { response in
            switch response.result {
            case .success(let data):
                let json = JSON(data)["data"]
                guard let mappedObject = Lists<Asset>(jsonData: json, key: "assets") else {
                    completion(Result.failure(ErrorCode.dataError))
                    return
                }
                completion(Result.success(mappedObject.items))
            case .failure(let error):
                completion(Result.failure(error))
            }
        }

    }
    
    /// 获取制定的数字资产
    /// （必须在OPENSDK的接口中传入PIN）
    ///
    /// - Parameters:
    ///   - id: assetId: 资产ID
    ///   - completion: 结果回调，数字资产或者错误
    /// - Returns: 返回请求体
    @discardableResult
    public class func getAsset(with id: String, completion: @escaping (Result<Asset>) -> Void) -> DataRequest {
        return NetworkManager.shared.request(api: OpenSDKAPI.asset(id: id))
            .responseData(completionHandler: { response in
                switch response.result {
                case .success(let data):
                    let json = JSON(data)["data"]
                    guard let mappedObject = Asset(jsonData: json["asset"]) else {
                        completion(Result.failure(ErrorCode.dataError))
                        return
                    }
                  
                    completion(Result.success(mappedObject))
                case .failure(let error):
                    completion(Result.failure(error))
                }
            })
    }


    
    /// 获取指定资产的交易记录
    /// （必须在OPENSDK的接口中传入PIN）
    ///
    /// - Parameters:
    ///   - id: 资产ID
    ///   - completion: 结果回调，交易记录或者错误
    /// - Returns: 返回请求体
    @discardableResult
    public class func getSnapShot(with id: String, completion: @escaping (Result<[Snapshot]>) -> Void) -> DataRequest {
        return NetworkManager.shared.request(api: OpenSDKAPI.snapshot(id: id))
            .responseData(completionHandler: { response in
                switch response.result {
                case .success(let data):
                    let json = JSON(data)["data"]
                    guard let mappedObject = Lists<Snapshot>(jsonData: json, key: "snapshots") else {
                        completion(Result.failure(ErrorCode.dataError))
                        return
                    }
                    completion(Result.success(mappedObject.items))
                case .failure(let error):
                    completion(Result.failure(error))
                }
            })
    }
    
    /// 获取所有交易记录列表
    /// （必须在OPENSDK的接口中传入PIN）
    ///
    /// - Parameter completion: 结果回调，交易记录或者错误
    /// - Returns: 返回请求体
    @discardableResult
    public class func getSnapshots(completion: @escaping (Result<[Snapshot]>) -> Void) -> DataRequest {
        return NetworkManager.shared.request(api: OpenSDKAPI.snapshots)
            .responseData(completionHandler: { response in
                switch response.result {
                case .success(let data):
                    let json = JSON(data)["data"]
                    guard let mappedObject = Lists<Snapshot>(jsonData: json, key: "snapshots") else {
                        completion(Result.failure(ErrorCode.dataError))
                        return
                    }
                    completion(Result.success(mappedObject.items))
                case .failure(let error):
                    completion(Result.failure(error))
                }
            })
    }
    
    /// 获取可用币种的的地址列表
    /// （必须在OPENSDK的接口中传入PIN）
    ///
    /// - Parameter completion: 结果回调，返回币种列表或者错误
    /// - Returns: 返回请求体
    @discardableResult
    public class func getWalletCoin(completion: @escaping (Result<[WalletCoin]>) -> Void) -> DataRequest {
        return NetworkManager.shared.request(api: OpenSDKAPI.walletAssets)
                .responseData(completionHandler: { response in
                    switch response.result {
                    case .success(let data):
                        let json = JSON(data)["data"]
                        guard let mappedObject = Lists<WalletCoin>(jsonData: json, key: "coins") else {
                            completion(Result.failure(ErrorCode.dataError))
                            return
                        }
                        completion(Result.success(mappedObject.items))
                    case .failure(let error):
                        completion(Result.failure(error))
                    }
                })
    }


    /// 转账
    /// （必须在OPENSDK的接口中传入PIN）
    ///
    /// - Parameters:
    ///   - address: 接收地址
    ///   - amount: 转账数量
    ///   - assetId: 资产ID
    ///   - memo: 备注
    ///   - label: 标签用于EOS
    ///   - completion: 结果回调，返回交易记录或者错误
    /// - Returns: 返回请求体
    @discardableResult
    public class func withdrawTo(address: String,
                                 amount: String,
                                 assetId: String,
                                 memo: String,
                                 label: String,
                                 completion: @escaping (Result<Snapshot>) -> Void) -> DataRequest {
        return NetworkManager.shared.request(api: OpenSDKAPI.withdraw(id: assetId, address: address, amount: amount, memo: memo, label: label))
                .responseData(completionHandler: { response in
                    switch response.result {
                    case .success(let data):
                        let json = JSON(data)["data"]
                        guard let mappedObject = Snapshot(jsonData: json["snapshot"]) else {
                            completion(Result.failure(ErrorCode.dataError))
                            return
                        }
                        completion(Result.success(mappedObject))
                    case .failure(let error):
                        completion(Result.failure(error))
                    }
                })
    }
    
    /// 获取转账手续费
    /// （必须在OPENSDK的接口中传入PIN）
    ///
    /// - Parameters:
    ///   - id: 资产ID
    ///   - address: 接收地址
    ///   - label: 标签用于EOS
    ///   - completion: 结果回调，返回手续费或者错误
    /// - Returns: 返回请求体
    @discardableResult
    public class func getFee(with id: String, address: String, label: String, completion: @escaping (Result<Fee>) -> Void) -> DataRequest {
        return NetworkManager.shared.request(api: OpenSDKAPI.fee(id: id, address: address, label: label))
                .responseData(completionHandler: { response in
                    switch response.result {
                    case .success(let data):
                        let json = JSON(data)["data"]
                        guard let mappedObject = Fee(jsonData: json["fee"]) else {
                            completion(Result.failure(ErrorCode.dataError))
                            return
                        }
                        completion(Result.success(mappedObject))

                    case .failure(let error):
                        completion(Result.failure(error))
                    }
                })
    }
    
    /// 设置PIN
    /// （必须在OPENSDK的接口中传入PIN）
    ///
    /// - Parameters:
    ///   - newPinToken: PINToken
    ///   - type: Pin类型
    ///   - completion: 结果回调，返回手续费或者错误
    /// - Returns: 返回请求体
    @discardableResult
    public class func setPin(newPinToken: String, type: Int, completion: @escaping (Result<Bool>) -> Void) -> DataRequest {
        return NetworkManager.shared.request(api: OpenSDKAPI.setPin(newPinToken: newPinToken, type: type))
                .responseData(completionHandler: { response in
                    switch response.result {
                    case .success(let data):
                        let json = JSON(data)["data"]
                        let statusCode = json["code"].intValue
                        if statusCode == 0 {
                            completion(Result.success(true))
                        } else {
                            completion(Result.success(false))
                        }

                    case .failure(let error):
                        completion(Result.failure(error))
                    }
                })
    }
    
    /// 修改PIN
    /// （必须在OPENSDK的接口中传入PIN）
    ///
    /// - Parameters:
    ///   - oldPinToken: 老的PINToken
    ///   - newPinToken: 新的PINToken
    ///   - type: 类型
    ///   - completion: 结果回调，返回成功或者错误
    /// - Returns: 返回请求体
    @discardableResult
    public class func changePin(oldPinToken: String, newPinToken: String, type: Int, completion: @escaping (Result<Bool>) -> Void) -> DataRequest {
        return NetworkManager.shared.request(api: OpenSDKAPI.changePin(oldPinToken: oldPinToken, newPinToken: newPinToken, type: type))
                .responseData(completionHandler: { response in
                    switch response.result {
                    case .success(let data):
                        let json = JSON(data)["data"]
                        let statusCode = json["code"].intValue
                        if statusCode == 0 {
                            completion(Result.success(true))
                        } else {
                            completion(Result.success(false))
                        }

                    case .failure(let error):
                        completion(Result.failure(error))
                    }
                })

    }
    
    /// 校验PIN
    /// （必须在OPENSDK的接口中传入PIN）
    ///
    /// - Parameters:
    ///   - pinToken: PINToken
    ///   - completion: 结果回调，返回成功或者错误
    /// - Returns: 返回请求体
    @discardableResult
    public class func validatePin(pinToken: String, completion: @escaping (Result<Bool>) -> Void) -> DataRequest {
        return NetworkManager.shared.request(api: OpenSDKAPI.validatePin(pinToken: pinToken))
                .responseData(completionHandler: { response in
                    switch response.result {
                    case .success(let data):
                        let json = JSON(data)["data"]
                        let statusCode = json["code"].intValue
                        if statusCode == 0 {
                            completion(Result.success(true))
                        } else {
                            completion(Result.success(false))
                        }

                    case .failure(let error):
                        completion(Result.failure(error))
                    }
                })
    }
}
