//
//  OpenSDKProvider.swift
//  FoxOne
//
//  Created by moubuns on 2018/7/11.
//  Copyright © 2018 FoxOne. All rights reserved.
//

import Foundation

public enum OpenSDKError: Swift.Error {
    case code(Int)
    case error(code: Int, message: String)
}

public struct ErrorCode {
    let errorCode = [
        1: NSLocalizedString("INVALID_OPERATION_MSG", comment: ""),
        2: NSLocalizedString("UNKNOWN_ERROR_MSG", comment: ""),
        3: NSLocalizedString("SERVER_FALUT_MSG", comment: ""),
        4: NSLocalizedString("login_err_frequently", comment: ""),
        6: NSLocalizedString("FORBIDDEN_MSG", comment: ""),
        1538: NSLocalizedString("user_not_found", comment: ""),
        1537: NSLocalizedString("USER_NOT_LOGGED_IN_MSG", comment: ""),
        1553: NSLocalizedString("pin_not_set_message", comment: ""),
        1554: NSLocalizedString("incorrect_pin_message", comment: ""),
        1560: NSLocalizedString("MIXIN_BIND_WITH_OTHER_USER_MSG", comment: ""),
        1561: NSLocalizedString("MIXIN_NOT_BIND_WITH_USER_MSG", comment: ""),
        1601: NSLocalizedString("invalid_public_key", tableName: "ErrorCode", comment: "invalid public key"),
        2005: NSLocalizedString("invalid_amount", tableName: "ErrorCode", comment: "invalinvalid_amountid_nickname"),
        2006: NSLocalizedString("amount_too_small", tableName: "ErrorCode", comment: "amount_too_small"),
        -1: NSLocalizedString("address_unavaliable", tableName: "ErrorCode", comment: "address_unavaliable")
    ]

    public static func errorMessage(for code: Int) -> String? {
        return ErrorCode().errorCode[code]
    }
}
