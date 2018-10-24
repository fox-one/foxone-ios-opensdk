//
//  CNYTicker.swift
//  FoxOne
//
//  Created by moubuns on 2018/10/10.
//

import Foundation

public struct CNYTicker: Codable {
    public let changeIn24h: String
    public let from: String
    public let price: String
    public let timestamp: TimeInterval
    public let to: String
}
