//
//  FoxOneOpenSDK.swift
//  opensdk
//
//  Created by moubuns on 2018/8/31.
//  Copyright © 2018 FoxOne. All rights reserved.
//

import Foundation

protocol OpenSDKDelegate: NSObjectProtocol {
    func accessToken() -> String
    func pin() -> String
}

public final class OpenSDK {
    internal weak var delegate: OpenSDKDelegate?
    internal var publicKey: String = ""
    internal static let shared = OpenSDK()
    
    /// 注册委托用来获取 用户Token 和 Pin
    ///
    /// - Parameter delegate: 回调
    func register(_ delegate: OpenSDKDelegate) {
        self.delegate = delegate
    }
    
    
    /// 设置请求加密的公钥
    ///
    /// - Parameter key: 公钥
    func setPublicKey(_ key: String) {
        self.publicKey = key
    }
    
    var baseURL: String {
        return "https://api.fox.one"
    }

}
