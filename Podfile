platform :ios, '12.0'
inhibit_all_warnings!

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '12.0'
        end
    end
end

target 'MVVMC' do
  
    use_frameworks!
    
    # Rx
    pod 'RxSwift', '~> 6.6.0'
    pod 'RxCocoa', '~> 6.6.0'
    pod 'RxDataSources', '~> 5.0.0'
    pod 'NSObject+Rx', '~> 5.2.2'
    
    # Foundation
    pod 'Then', '~> 3.0.0'
    pod 'R.swift', '~> 7.3.2'
    pod 'CryptoSwift', '~> 1.8.0'
    pod 'KeychainSwift', '~> 20.0'
    pod 'SQLite.swift', '~> 0.14.1'
    pod 'SwiftDate', '~> 6.3.1'
    
    # Network
    pod 'Moya/RxSwift', '~> 15.0.0'
    pod "Moya-SwiftyJSONMapper/RxSwift", '~> 6.1.0'
    
    # Image
    pod 'Kingfisher', '~> 7.9.1'
    
    # UI
    pod 'SnapKit', '~> 5.6.0'
    pod 'MBProgressHUD', '~> 1.2.0'
    pod 'SwiftMessages', '~> 9.0.8'
    pod 'IQKeyboardManagerSwift', '~> 6.5.16'
    pod 'MJRefresh', '~> 3.7.5'

end
