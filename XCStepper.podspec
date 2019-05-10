
Pod::Spec.new do |s|
  s.name             = 'XCStepper'
  s.version          = '0.0.1'
  s.summary          = 'XCStepper'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = 'A short description of XCStepper'

  s.homepage         = 'https://github.com/butterflyXX/XCStepper'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'butterflyXX' => 'liuxiaochen1991@icloud.com' }
  s.source           = { :git => 'https://github.com/butterflyXX/XCStepper.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'XCStepper/Classes/**/*'
  
  # s.resource_bundles = {
  #   'XCStepper' => ['XCStepper/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
