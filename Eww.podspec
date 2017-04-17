#
# Be sure to run `pod lib lint Eww.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'Eww'
  s.version          = '0.0.1'
  s.summary          = 'Establish wonderful work'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://coding.net/u/joeytat/p/Eww'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'joeytat' => 'joeyqaq@gmail.com' }
  s.source           = { :git => 'https://git.coding.net/joeytat/Eww.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '10.0'

  s.source_files = 'Eww/Classes/**/*'
  
  # s.resource_bundles = {
  #   'Eww' => ['Eww/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'

  s.frameworks = 'UIKit'
  s.dependency 'RxSwift', '~> 3.4.0'
  s.dependency 'RxCocoa', '~> 3.2.0'
  s.dependency 'RxGesture', '~> 1.0.0'
  s.dependency 'Moya-ObjectMapper/RxSwift', '~> 2.3.1'
  s.dependency 'Moya', '~> 8.0.3'
  s.dependency 'SnapKit', '~> 3.2.0'
  s.dependency 'RxOptional', '~> 3.1.3'
  s.dependency 'IQKeyboardManagerSwift', '~> 4.0.9'
  s.dependency 'KeychainAccess', '~> 3.0.2'
  s.dependency 'Whisper', '~> 4.0.0'
  s.dependency 'KMNavigationBarTransition', '~> 1.0.0'
  s.dependency 'VisualEffectView', '~> 2.0.6'
  s.dependency 'Kingfisher', '~> 3.6.2'
  s.dependency 'RxDataSources', '~> 1.0.3'
  s.dependency 'Hero', '~> 0.3.6'
  s.dependency 'DGCollectionViewLeftAlignFlowLayout', '~> 1.0.1'
  s.dependency 'BBBadgeBarButtonItem', '~> 1.2'
  s.dependency 'NVActivityIndicatorView', '~> 3.6.0'

end
