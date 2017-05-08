#
# Be sure to run `pod lib lint Eww.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'Eww'
  s.version          = '0.0.4'
  s.summary          = 'Work Library'

  s.description      = <<-DESC
  Establish wonderful work
                       DESC

  s.homepage         = 'https://coding.net/u/joeytat/p/Eww'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'joeytat' => 'joeyqaq@gmail.com' }
  s.source           = { :git => 'https://github.com/joeytat/GarageSpecs', :tag => s.version.to_s }

  s.ios.deployment_target = '9.0'

  s.source_files = 'Eww/Classes/**/*'
  
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
  s.dependency 'BSImagePicker', '~> 2.6.0'

end
