//
//  OpenSDK.swift
//  FoxOne
//
//  Created by moubuns on 2018/8/30.
//  Copyright © 2018 FoxOne. All rights reserved.
//

import Foundation
import UIKit

public protocol OpenSDKProtcol: NSObjectProtocol {
    /// AccessToken
    func f1AccessToken() -> String
    /// PIN加密使用的公钥匙
    func f1PublicKey() -> String
    
    /// PIN
    func f1Pin() -> String

}

public final class OpenSDK {
    internal static let shared = OpenSDK()
    internal let sdkverison: String = "0.0.1"
    internal let hostURLString = "https://ali-api.lyricwei.cn/api"
    internal var baseURL: String {
        return hostURLString
    }

    internal weak var delegate: OpenSDKProtcol?

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
    
    internal func httpHeader() -> [String: String] {
        let buildVersion = "0"
        let appVersion = self.sdkverison
        let clientType = "5"
        let uuid = UIDevice.current.identifierForVendor?.uuidString ?? ""
        
        return ["x-client-build": buildVersion,
                                                     "x-client-type": clientType,
                                                     "x-client-version": appVersion,
                                                     "x-client-device-id": uuid
            ]
    }
}
