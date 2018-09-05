//
//  Snapshot.swift
//  FoxOne
//
//  Created by moubuns on 2018/6/26.
//  Copyright © 2018 FoxOne. All rights reserved.
//

import Foundation

public struct Snapshot: Codable {
    
    /// 资产ID
    public let assetId: String
    
    /// 金额
    public let amount: Double
    
    /// 对应Fox.ONE Coin Id
    public let coinId: Int
    
    public let counterUserId: String
    
    /// 是否Mixin网络
    public let insideMixin: Bool
    
    /// 创建时间
    public let createdAt: Int
    
    /// 备注
    public let memo: String
    
    /// 交易记录Id
    public let snapshotId: String
    
    public let traceId: String
    
    public let transactionHash: String
}
