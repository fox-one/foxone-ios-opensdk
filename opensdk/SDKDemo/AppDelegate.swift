//
//  AppDelegate.swift
//  SDKDemo
//
//  Created by moubuns on 2018/9/3.
//  Copyright © 2018 FoxOne. All rights reserved.
//

import UIKit
import FoxOneOpenSDK

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        OpenSDK.registerSDK(key: "0001", delegate: self, env: .dev)
        
        return true
    }
}

extension AppDelegate: OpenSDKProtcol {
    func f1AccessToken() -> String {
        return ""
    }
    
    func f1PIN() -> String {
        return  ""
    }
    
}

