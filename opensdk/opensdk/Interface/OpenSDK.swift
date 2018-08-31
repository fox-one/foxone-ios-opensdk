//
//  OpenSDK.swift
//  FoxOne
//
//  Created by moubuns on 2018/8/30.
//  Copyright © 2018 FoxOne. All rights reserved.
//

import Foundation

public protocol OpenSDKProtcol: NSObjectProtocol {
    func accessToken() -> String
    func publicKey() -> String
}

public final class OpenSDK {
    internal static let shared = OpenSDK()
    internal let baseURL: String

    public weak var delegate: OpenSDKProtcol?

    init() {
        baseURL = "https://ali-api.lyricwei.cn/api"
    }

    public static func setDelegate(_ delegate: OpenSDKProtcol) {
        OpenSDK.shared.delegate = delegate
    }

    static func getURL() -> URL {
        return URL(string: OpenSDK.shared.baseURL)!
    }

    /// PIN混淆
    ///
    /// - Parameter pin: PIN
    /// - Returns: 混淆结果
    public class func confusionPin(pin: String) -> String {
        let md5Pin = String(format: "fox.%@", pin).md5()
        return md5Pin.rsaToken ?? ""
    }

    public class func generatePinToken(with pin: String) -> String {
        return SecureData(key: pin).jsonString?.rsaToken ?? ""
    }
}
