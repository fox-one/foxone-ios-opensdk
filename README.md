# Fox.ONE Open SDK in Swift

Integrate your app with Fox.One open SDK, Including: 

* Withdraw
* Deposit
* Assets Overview
* Transation Record
* PIN

## Installation    
### CocoaPods

Make sure you are running the latest version of [CocoaPods](https://cocoapods.org) by running:

```bash
gem install cocoapods

# (or if the above fails)
sudo gem install cocoapods
```

**Note:** This step is optional, if you updated the specs repo recently.

Add the following lines to your Podfile:

```ruby
pod 'FoxOneOpenSDK'
pod 'Alamofire'
pod 'SwiftyJSON'
pod 'SwiftyRSA'
pod 'CryptoSwift'
```

Run `pod install` 


## Using Open SDK in your APP

1. Request API Key

    
2. Register SDK in App
     
    ```
    //import SDK
    import FoxOneOpenSDK
    
    //Register
    OpenSDK.setDelegate(self)
    ```
3. Implement SDK Delegate

    ```
    
     //Set your Access Token
     func f1AccessToken() -> String {
            return AccountManager.shared.user?.token ?? ""
        }
     //Config Pin Crypto method
     func f1PublicKey() -> String {
            return PinManager.shared.appConfig.crypto.publicKey
        }
    ```
4. API SDK Service
  
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
##  API 
    
  - [API](https://github.com/fox-one/foxone-ios-opensdk/blob/master/API.md) - The OpenSDKService API

## Give Feedback

