//
//  OpenSDK.swift
//  FoxOne
//
//  Created by moubuns on 2018/8/30.
//  Copyright © 2018 FoxOne. All rights reserved.
//

import Foundation

public protocol OpenSDKProtcol: NSObjectProtocol {
    /// AccessToken
    func f1AccessToken() -> String
    /// PIN加密使用的公钥匙
    func f1PublicKey() -> String
    /// FoxOne 钱包地址
    func f1HostURLString() -> String
    /// FoxOne 后端请求Header
    func f1HttpHeader() -> [String: String]
}

public final class OpenSDK {
    internal static let shared = OpenSDK()
    internal var baseURL: String {
        return self.delegate?.f1HostURLString() ?? ""
    }

    public weak var delegate: OpenSDKProtcol?

    init() {}
    /// 注册OpenSDK
    public static func setDelegate(_ delegate: OpenSDKProtcol) {
        OpenSDK.shared.delegate = delegate
    }

    /// 生成PIN混淆之后的PinToken
    ///
    /// - Parameter pin: PIN
    /// - Returns: PinToken
    public class func generateConfusionPinToken(pin: String) -> String {
        let md5Pin = String(format: "fox.%@", pin).md5()
        return md5Pin.rsaToken ?? ""
    }
    
    /// 生成PIN未混淆的PinToken
    ///
    /// - Parameter pin: PIN
    /// - Returns: PinToken
    public class func generatePinToken(with pin: String) -> String {
        return SecureData(key: pin).jsonString?.rsaToken ?? ""
    }
}
