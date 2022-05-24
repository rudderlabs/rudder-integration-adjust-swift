source 'https://github.com/CocoaPods/Specs.git'
workspace 'RudderAdjust.xcworkspace'
use_frameworks!
inhibit_all_warnings!
platform :ios, '13.0'

def shared_pods
    pod 'Rudder'
end

target 'RudderAdjust' do
    project 'RudderAdjust.xcodeproj'
    shared_pods
    pod 'Adjust' , '4.29.7'
end

target 'SampleAppObjC' do
    project 'Examples/SampleAppObjC/SampleAppObjC.xcodeproj'
    shared_pods
    pod 'RudderAdjust', :path => '.'
end

target 'SampleAppSwift' do
    project 'Examples/SampleAppSwift/SampleAppSwift.xcodeproj'
    shared_pods
    pod 'RudderAdjust', :path => '.'
end
