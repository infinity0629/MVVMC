platform :ios, '12.0'

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '12.0'
        end
    end
end

target 'MVVMC' do
  
    use_frameworks!
    
    # Foundation
    pod 'Then', '~> 3.0.0'
    pod 'R.swift', '~> 7.3.2'
    
    # Network
    pod 'Moya', '~> 15.0.0'
    
    # Image
    pod 'Kingfisher', '~> 7.9.1'
    
    # UI
    pod 'SnapKit', '~> 5.6.0'

    # Rx
    pod 'RxSwift', '~> 6.6.0'
    pod 'RxDataSources', '~> 5.0.0'

end
