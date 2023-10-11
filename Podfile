platform :ios, '12.0'

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '12.0'
    end
  end
end

target 'MVVMC' do

    # Comment the next line if you don't want to use dynamic frameworks
    use_frameworks!

    # Pods for MVVMC
    pod 'RxSwift', '~> 6.5.0'
    pod 'RxCocoa', '~> 6.5.0'
    pod 'RxDataSources', '~> 5.0'
    pod 'Moya', '~> 15.0.0'
    pod 'Moya/RxSwift', '~> 15.0.0'
    pod 'Then', '~> 3.0.0'
    pod 'R.swift', '~> 7.3.2'
    pod 'URLNavigator', '~> 2.5.1'
    pod 'SnapKit', '~> 5.6.0'
    pod 'Kingfisher', '~> 7.9.1'
    
end
