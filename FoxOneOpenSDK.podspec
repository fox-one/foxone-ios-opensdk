Pod::Spec.new do |s|
  s.name         = "FoxOneOpenSDK"
  s.version      = "1.2.1"
  s.summary      = "FoxOne Open SDK"

  s.description  = "FoxOne Open SDK for iOS"

  s.homepage     = "https://github.com/fox-one/foxone-ios-opensdk"
  s.license      = "Apache License 2.0"
  s.author             = { "moubuns" => "mengwl@fox.one" }
  s.ios.deployment_target = "8.3"
  s.source       = { :git => "https://github.com/fox-one/foxone-ios-opensdk.git", :tag => "#{s.version}" }

  s.source_files  = "opensdk/opensdk/**/*.swift"
  s.resources = "opensdk/opensdk/Resource/**/*.*"
  s.swift_version = "4.2"
  s.requires_arc = true
  s.dependency "Alamofire" 
  s.dependency "SwiftyJSON"
  s.dependency "SwiftyRSA"
  s.dependency "CryptoSwift"

end
