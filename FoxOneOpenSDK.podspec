Pod::Spec.new do |s|
  s.name         = "FoxOneOpenSDK"
  s.version      = "0.0.1"
  s.summary      = "FoxOne Open SDK"

  s.description  = "FoxOne Open SDK for iOS"

  s.homepage     = "https://github.com/fox-one/foxone-ios-opensdk"
  s.license      = "Apache License 2.0"
  s.author             = { "moubuns" => "mengwl@fox.one" }
  s.ios.deployment_target = "9.0"
  s.source       = { :git => "git@github.com:fox-one/foxone-ios-opensdk.git", :tag => "#{s.version}" }

  s.source_files  = "opensdk/opensdk/**/*.swift"
  s.resources = "opensdk/opensdk/Resource/**/*.*"
  s.swift_version = "4.1"
  s.requires_arc = true
  s.dependency "Alamofire", "~> 4.7"
  s.dependency "SwiftyJSON", "~> 4.0"
  s.dependency "SwiftyRSA"
  s.dependency "CryptoSwift"

end
