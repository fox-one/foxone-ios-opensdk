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
    /// PIN加密使用的公钥匙
    func f1PublicKey() -> String

    /// PIN
    func f1PIN() -> String
    
    /// FoxOne API地址，选配
    @objc optional func f1HostURLString() -> String
    
    /// FoxOne 定制请求Header，选配
    @objc optional func f1HttpHeader() -> [String: String]
}

struct SDKConfig {
    let defaultURLString = "https://ali-api.lyricwei.cn/api"
    let sdkVerison = "0.0.2"
}

public final class OpenSDK {
    internal static let shared = OpenSDK()
    internal let defalutConfig = SDKConfig()
    
    internal var baseURL: String {
        guard let url = self.self.delegate?.f1HostURLString?() else {
            return defalutConfig.defaultURLString
        }
        
        return url
    }

    internal var key: String?
    
    internal weak var delegate: OpenSDKProtcol?

    /// 注册OpenSDK
    public static func registerSDK(key: String, delegate: OpenSDKProtcol) {
        OpenSDK.shared.key = key
        OpenSDK.shared.delegate = delegate
    }
}
