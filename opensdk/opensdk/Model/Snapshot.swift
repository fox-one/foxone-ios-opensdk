//
//  Snapshot.swift
//  FoxOne
//
//  Created by moubuns on 2018/6/26.
//  Copyright © 2018 FoxOne. All rights reserved.
//

import Foundation

public struct Snapshot: Codable {
    public let amount: Double
    public let assetId: String
    public let coinId: Int
    public let counterUserId: String
    public let insideMixin: Bool
    public let createdAt: Int
    public let memo: String
    public let snapshotId: String
    public let traceId: String
    public let transactionHash: String
}
