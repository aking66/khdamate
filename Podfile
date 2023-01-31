platform :ios, '13.0'

use_frameworks!

def networking_pods
    #pod 'RestKit', :git => 'https://github.com/RestKit/RestKit.git', :commit => '13d98d5a6a5e06656ad040013dcae149b7cf8b99'
    pod 'Alamofire', '~> 4.7'
    pod 'SONetwork'

end

def firebase_pods
    pod 'Firebase'
    pod 'Firebase/Core'
    pod 'Firebase/Messaging'
    pod 'Firebase/Auth'
    pod 'Firebase/Crashlytics'
    pod 'Firebase/Analytics'
    pod 'Firebase/Database'
end

def shared_helpers_pods
    pod 'IQKeyboardManagerSwift', '6.2.1'
    pod 'MagicalRecord', '2.3.2'
    pod 'DZNEmptyDataSet',:git => 'https://gitlab.com/mja050/dznemptydataset.git'
    pod 'CocoaDebug', '~> 1.6.3', :configurations => ['Debug']
end

def base_helpers_pods
    pod 'MWPhotoBrowser', '2.1.1'
    pod 'MFSideMenu', '0.5.5'
    pod 'MD5Digest', '1.1.0'
#    pod 'MWWebImage'
    pod 'SDWebImage'#, '~> 4.0' #https://github.com/rs/SDWebImage
    pod 'FDTake', :git => 'https://gitlab.com/mja050/fdtake.git'
    pod 'DKCamera'
    pod 'QBImagePickerController'
    pod 'LocationPickerViewControllerRTL'
    pod 'IQDropDownTextField', '2.0'
    pod 'MIBlurPopup'
    pod 'DateToolsSwift'
    pod 'DateTools'
    pod 'SwifterSwift'
    pod 'SwiftPullToRefresh', '2.0.0'
    pod 'UINavigationBar+Addition'
    pod 'UITextView+Placeholder', '1.3.3'
    pod 'EZSwiftExtensions', :git => 'https://gitlab.com/mja050/ezswiftextensions.git'
    pod 'Appz'
    pod 'SVProgressHUD'
    pod 'Fastis', '~> 2.0'
    pod 'LocationPickerViewController'

end


def secondary_helpers_pods
    pod 'NSURL+QueryDictionary', '1.1.0'
    pod 'NYXImagesKit', '2.3'
    pod 'BlocksKit', '2.2.5'
    pod 'FXImageView', '1.3.5'
    pod 'FormatterKit', '1.8.0'
    pod 'SKSTableView', '0.0.2'
    pod 'BFKit', '1.9.3'
    pod 'FCFileManager', '1.0.18'
    pod 'JVFloatLabeledTextField'  #https://github.com/jverdi/JVFloatLabeledTextField
    pod 'AlignedCollectionViewFlowLayout',:git => "https://github.com/mischa-hildebrand/AlignedCollectionViewFlowLayout.git"
    pod 'AnyFormatKit'
    pod 'SkeletonView'
end

def project_base_pods
    pod 'FaceAware' ,'1.2.0'#https://github.com/BeauNouvelle/FaceAware
    pod 'SZTextView' ,'1.2.1' #https://github.com/glaszig/SZTextView
    pod 'SwiftLocation', '~> 3.1.0'
    pod 'SHMultipleSelect'
    pod 'HCSStarRatingView'
    pod 'BEMCheckBox'
    pod 'AFSoundManager'
    pod 'XCDYouTubeKit', '~> 2.8.2'
    pod 'XLPagerTabStrip', '~> 7.0'
    pod 'FSPagerView'
    pod 'SwiftRandom', :git => 'https://github.com/thellimist/SwiftRandom.git', :commit => '647daf9ab8c0234632a866e36a3733128c5089ce'
    pod 'SwiftPhoneNumberFormatter'
end

def custom_pods
    pod 'FSPagerView'
    pod 'SwiftPhoneNumberFormatter'
    pod 'SwiftyCodeView'
    pod 'SwiftLocation', '~> 3.1.0'
    pod 'BottomPopup'
    pod 'BEMCheckBox'
    pod 'iRecordView' #https://github.com/3llomi/iRecordView
    pod 'Recorder' #https://github.com/jgorset/Recorder
    pod 'AlertsPickers',:git => "https://gitlab.com/mja050/AlertsPickersPod.git"
    pod 'FTPopOverMenu_Swift', '~> 0.1.4' #https://github.com/liufengting/FTPopOverMenu_Swift
    pod 'HCSStarRatingView'
    pod 'ActiveLabel'
    pod 'RSSelectionMenu'
    pod 'FSCalendar'# https://github.com/WenchaoD/FSCalendar
    pod 'DKCamera'
    pod 'QBImagePickerController'
end

target 'khdamate' do
    
    networking_pods
    shared_helpers_pods
    base_helpers_pods
    custom_pods
    firebase_pods
    #secondary_helpers_pods
    #project_base_pods
    
end

post_install do |installer|
    tagretBuildSettings = {
        "_" => {
            "ENABLE_BITCODE" => "YES",
            "SWIFT_VERSION" => "4.2"
        },
        "FDTake" => {
            "SWIFT_VERSION" => "4.2"
        },
        "IQKeyboardManagerSwift" => {
            "SWIFT_VERSION" => "4.2"
        },
        "SwiftPullToRefresh" => {
            "SWIFT_VERSION" => "4.0"
        },
        "SwifterSwift" => {
            "SWIFT_VERSION" => "4.2"
        },
        "MIBlurPopup" => {
            "SWIFT_VERSION" => "4.0"
        },
        "EZSwiftExtensions" => {
            "SWIFT_VERSION" => "4.0"
        },
        "AlertsPickers" => {
            "SWIFT_VERSION" => "4.0"
        },
    }
    
    installer.pods_project.targets.each do |target|
        
        # Global Config
        target_settings = tagretBuildSettings['_']
        target.build_configurations.each do |config|
            config.build_settings.merge! target_settings
        end
        
        # Custom Config
        if tagretBuildSettings.has_key?(target.name) then
            target_settings = tagretBuildSettings[target.name]
            target.build_configurations.each do |config|
                # puts "#{target.name} - #{config.name} - #{target_settings}"
                config.build_settings.merge! target_settings
            end
        end
    end
    
    installer.pods_project.targets.each do |target|
      if target.respond_to?(:product_type) and target.product_type == "com.apple.product-type.bundle"
        target.build_configurations.each do |config|
            config.build_settings['CODE_SIGNING_ALLOWED'] = 'NO'
        end
      end
    end

end

