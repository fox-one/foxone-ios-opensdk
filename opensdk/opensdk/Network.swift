//
//  Network.swift
//  FoxOne
//
//  Created by moubuns on 2018/8/31.
//  Copyright © 2018 FoxOne. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class AccessTokenAdapter: RequestAdapter {
    init() {}
    
    func adapt(_ urlRequest: URLRequest) throws -> URLRequest {
        var urlRequest = urlRequest
        
        if let urlString = urlRequest.url?.absoluteString, urlString.hasPrefix(OpenSDK.shared.baseURL) {
            let accessToken = OpenSDK.shared.delegate?.f1AccessToken() ?? ""
            urlRequest.setValue("Bearer " + accessToken, forHTTPHeaderField: "Authorization")
            if let header = OpenSDK.shared.delegate?.f1HttpHeader() {
                header.forEach { key, value in
                    urlRequest.setValue(value, forHTTPHeaderField: key)
                }
            }
        }
        
        return urlRequest
    }
}

final class NetworkManager {
    static let shared = NetworkManager()
    let sessionManager = SessionManager()
   
    init() {
        sessionManager.adapter = AccessTokenAdapter()
    }
    
    open func request(api: OpenSDKAPI) -> DataRequest {
        return sessionManager
            .request(api.url,
                     method: api.method,
                     parameters: api.parameters,
                     encoding: api.parameterEncoding,
                     headers: api.headers)
            .validate({ _, response, data -> Request.ValidationResult in
                var acceptableStatusCodes: [Int] { return Array(200..<300) }
                if acceptableStatusCodes.contains(response.statusCode) {
                    return .success
                } else {
                    guard let data = data else {
                        return .failure(ErrorCode.dataError)
                    }
                    
                    let json = JSON(data)
                    let statusCode = json["code"].intValue
                    return .failure(OpenSDKError.error(code: statusCode, message: ErrorCode.errorMessage(for: statusCode) ?? json["msg"].stringValue))
                }
            })
    }
}
