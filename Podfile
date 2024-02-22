# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'KSR_2024' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for KSR_2024
pod 'Then'
pod 'SnapKit'
pod 'FontAwesome.swift'
pod "PagingKit"


pod 'JTAppleCalendar', '~> 7.0'
pod 'RealmSwift'

 pod 'Alamofire'



  #https://firebase.google.com/docs/ios/setup
  pod 'Firebase/Core'
  pod 'Firebase/Messaging'

  #https://firebase.google.com/docs/crashlytics?hl=ko
  pod 'Firebase/Crashlytics'
  pod 'Firebase/Analytics'


end

post_install do |installer|
    installer.generated_projects.each do |project|
          project.targets.each do |target|
              target.build_configurations.each do |config|
                  config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '12.0'
               end
          end
   end
end
