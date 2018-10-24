//
//  OpenSDK.swift
//  FoxOne
//
//  Created by moubuns on 2018/8/30.
//  Copyright © 2018 FoxOne. All rights reserved.
//

import Foundation

@objc
public protocol OpenSDKProtcol: NSObjectProtocol {
    /// AccessToken
    func f1AccessToken() -> String
    
    /// PIN
    func f1PIN() -> String
    
    /// PIN加密使用的公钥匙
    @objc optional func f1PublicKey() -> String

    /// FoxOne API地址，选配
    @objc optional func f1HostURLString() -> String

    /// FoxOne 定制请求Header，选配
    @objc optional func f1HttpHeader() -> [String: String]
}



public final class OpenSDK {
    internal static let shared = OpenSDK()
    internal var defalutConfig = SDKConfig()
    
    internal var publicKey: String {
        guard let pubKey = self.delegate?.f1PublicKey?() else {
            return defalutConfig.env.defaultPublicKey
        }
        return pubKey

    }
    internal var baseURL: String {
        guard let url = self.delegate?.f1HostURLString?() else {
            return defalutConfig.env.serverApi
        }

        return url
    }

    internal var appKey: String?

    internal weak var delegate: OpenSDKProtcol?

    /// 注册OpenSDK
    public static func registerSDK(key: String, delegate: OpenSDKProtcol, env: SDKEnviroment = .product ) {
        OpenSDK.shared.appKey = key
        OpenSDK.shared.delegate = delegate
        OpenSDK.shared.defalutConfig.env = env
    }
}
