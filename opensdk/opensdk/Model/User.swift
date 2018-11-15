//
//  User.swift
//  FoxOneOpenSDK
//
//  Created by moubuns on 2018/11/15.
//  Copyright © 2018 FoxOne. All rights reserved.
//

import Foundation

public struct User: Codable {
    public let id: String
    public let avatar: String
    public let email: String
    public let name: String
    public let isActive: Bool
    public let isPinSet: Bool
    public let pinType: Int
    
    init() {
        id = ""
        avatar = ""
        email = ""
        name = ""
        isActive = false
        isPinSet = false
        pinType = 0
    }
}
