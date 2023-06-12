source 'https://github.com/CocoaPods/Specs.git'
workspace 'RudderAdjust.xcworkspace'
use_frameworks!
inhibit_all_warnings!
platform :ios, '13.0'

target 'RudderAdjust' do
    project 'RudderAdjust.xcodeproj'
    pod 'Rudder', '~> 2.0'
    pod 'Adjust', '4.29.7'
end

target 'SampleAppObjC' do
    project 'Examples/SampleAppObjC/SampleAppObjC.xcodeproj'
    pod 'RudderAdjust', :path => '.'
end

target 'SampleAppSwift' do
    project 'Examples/SampleAppSwift/SampleAppSwift.xcodeproj'
    pod 'RudderAdjust', :path => '.'
end
