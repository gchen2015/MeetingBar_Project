Pod::Spec.new do |s|
s.name         = "MeetBar_Project"
s.version      = "1.0.0"
s.ios.deployment_target = '7.0'
s.summary      = "A delightful setting interface framework."
s.homepage     = "https://github.com/lgwResources/MeetingBar_Project"
s.license              = { :type => "MIT", :file => "LICENSE" }
s.author             = { "lgwResources" => "962210371@qq.com" }
s.source       = { :git => "https://github.com/lgwResources/MeetingBar_Project.git", :tag => "v#{s.version}" }
s.source_files  = "MeetBar_Project/*.{h,m}"
s.requires_arc = true
end
