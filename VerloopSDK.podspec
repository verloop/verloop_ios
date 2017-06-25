Pod::Spec.new do |s|
s.name             = 'VerloopSDK'
s.version          = '0.1.0'
s.summary          = 'This SDK allows you to integrate Verloop into your app.'

s.description      = 'Verloop is a Customer Support and Engagement automation platform. iOS SDK allows you to integrate Verloop into your app and serve customers an improved and faster experience.'

s.homepage         = 'https://github.com/verloop/verloop_ios'
s.license          = { :type => 'MIT', :file => 'LICENSE' }
s.author           = { 'Verloop' => 'hello@verloop.io' }
s.source           = { :git => 'https://github.com/verloop/verloop_ios.git', :tag => s.version.to_s }

s.ios.deployment_target = '10.0'
s.source_files = 'VerloopSDK/Verloop/*'

end
