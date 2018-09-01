//
//  SecureData.swift
//  FoxOne
//
//  Created by moubuns on 8/1/18.
//  Copyright © 2018 FoxOne. All rights reserved.
//

import UIKit
import SwiftyRSA
import CryptoSwift

struct SecureData: Codable {
    let key: String
    let time: Int = Int(Date().timeIntervalSince1970)
    let nonce: String = UUID().uuidString
    
    enum CodingKeys: String, CodingKey {
        case key = "p"
        case time = "t"
        case nonce = "n"
    }
}

extension SecureData {
    var jsonString: String? {
        do {
            let jsonData = try JSONEncoder().encode(self)
            return String(data: jsonData, encoding: .utf8)
        } catch {
            return nil
        }
    }
}

extension String {
    var rsaToken: String? {
        do {
            let publicKey = try PublicKey(pemEncoded: OpenSDK.shared.delegate?.f1PublicKey() ?? "")
            let clear = try ClearMessage(string: self, using: .utf8)
            let encrypted = try clear.encrypted(with: publicKey, padding: .OAEP)
            #if DEBUG
            print("====== Fox.One ======")
            print("pinToken= \(encrypted.base64String)")
            print("====== Fox.One ======")
            #else
            #endif

            return encrypted.base64String
        } catch {
            return nil
        }
    }
}
