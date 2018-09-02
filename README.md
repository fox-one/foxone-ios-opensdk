# foxone-ios-opensdk
Fox.ONE Open SDK in Swift

Integrate your app with Fox.One open SDK, Including: 

* Withdraw
* Deposit
* Assets Overview
* Transation Record
* PIN

# Installation    

CocoaPods


# Dependencies

Alamofire
SwiftyJSON
SwiftyRSA
CryptoSwift


# Using Open SDK

1. Request API Key
    
2. Register SDK in App
     
    ```
    OpenSDK.setDelegate(self)
    ```
3. implement SDK Delegate

    ```
     func f1AccessToken() -> String {
            return AccountManager.shared.user?.token ?? ""
        }
        
        func f1PublicKey() -> String {
            return PinManager.shared.appConfig.crypto.publicKey
        }
    ```
4. Invoke SDK Service
  
    ```  
    OpenSDKService.getAssets { completion in
                switch completion {
                case .success(let assets):
                    self.handle(assets: assets)
                case .failure:
                    break
                }
            }
    ```
