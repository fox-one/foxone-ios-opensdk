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

Add the following lines to your Podfile:

```ruby
pod 'FoxOneOpenSDK'
```

Run `pod install` 


## Using Open SDK in your APP

1. Request API Key
   
    
2. Register SDK in App
     
    ```swift
    //import SDK
    import FoxOneOpenSDK
    
    //Register
    OpenSDK.registerSDK(key: "key", delegate: self)
    ```
3. Implement SDK Delegate

    ```swift
  extension AppDelegate: OpenSDKProtcol {
        //session token 
        func f1AccessToken() -> String {
            return ""
        }
        
        func f1PublicKey() -> String {
            return ""
        }
        
        func f1PIN() -> String {
            return  ""
        }
    }
    ```
4. API SDK Service
  
    ```swift  
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

mengwl@fox.one
