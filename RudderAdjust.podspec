Pod::Spec.new do |s|
    s.name             = 'RudderAdjust'
    s.version          = '1.0.0'
    s.summary          = 'Privacy and Security focused Segment-alternative. Adjust Native SDK integration support.'

    s.description      = <<-DESC
Rudder is a platform for collecting, storing and routing customer event data to dozens of tools. Rudder is open-source, can run in your cloud environment (AWS, GCP, Azure or even your data-centre) and provides a powerful transformation framework to process your event data on the fly.
                       DESC

    s.homepage         = 'https://github.com/rudderlabs/rudder-integration-adjust-swift'
    s.license          = { :type => "Apache", :file => "LICENSE" }
    s.author           = { 'RudderStack' => 'arnab@rudderlabs.com' }
    s.source           = { :git => 'https://github.com/rudderlabs/rudder-integration-adjust-swift.git', :tag => 'v#{s.version}' }

    s.ios.deployment_target = '13.0'
    s.tvos.deployment_target = '11.0'
    
    s.source_files = 'Sources/**/*{h,m,swift}'
    s.module_name = 'RudderAdjust'
    s.swift_version = '5.3'

    s.dependency 'RudderStack'
    s.dependency 'Adjust' , '4.29.7'
end
