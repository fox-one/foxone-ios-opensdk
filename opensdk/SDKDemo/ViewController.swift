//
//  ViewController.swift
//  SDKDemo
//
//  Created by moubuns on 2018/9/3.
//  Copyright © 2018 FoxOne. All rights reserved.
//

import UIKit
import FoxOneOpenSDK

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        OpenSDKService.getAssets { completion in
            switch completion {
            case .success(let assets):
                print(assets)
            case .failure(let error):
                print(error)
                break
            }
        }
    }
}

