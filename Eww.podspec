#
# Be sure to run `pod lib lint Eww.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
s.name             = 'Eww'
s.version          = '0.0.9'
s.summary          = 'Work Library'

s.description      = <<-DESC
Establish wonderful work
DESC

s.homepage         = 'https://github.com/joeytat/Eww'
s.license          = { :type => 'MIT', :file => 'LICENSE' }
s.author           = { 'joeytat' => 'joeyqaq@gmail.com' }
s.source           = { :git => 'https://github.com/joeytat/Eww.git', :tag => s.version.to_s }


s.ios.deployment_target = '9.0'

s.source_files = 'Eww/Classes/**/*'

s.frameworks = 'UIKit'
s.dependency 'RxSwift', '~> 3.6.1'
s.dependency 'RxCocoa', '~> 3.6.1'
s.dependency 'RxGesture', '~> 1.0.0'
s.dependency 'Moya-ObjectMapper', '~> 2.4.2'
s.dependency 'Moya', '~> 9.0.0'
s.dependency 'SnapKit', '~> 3.2.0'
s.dependency 'RxOptional', '~> 3.1.3'
s.dependency 'IQKeyboardManagerSwift', '~> 4.0.9'
s.dependency 'KeychainAccess', '~> 3.0.2'
s.dependency 'KMNavigationBarTransition', '~> 1.1.1'
s.dependency 'VisualEffectView', '~> 2.0.6'
s.dependency 'Kingfisher', '~> 3.6.2'
s.dependency 'RxDataSources', '~> 2.0.2'
s.dependency 'Hero', '~> 0.3.6'
s.dependency 'DGCollectionViewLeftAlignFlowLayout', '~> 1.0.1'
s.dependency 'BBBadgeBarButtonItem', '~> 1.2'
s.dependency 'BSImagePicker', '~> 2.6.0'
s.dependency 'ObjectMapper', '~> 2.2.8'
s.dependency 'NSObject+Rx', '~> 2.3.0'
s.dependency 'SwiftyDrop', '~> 3.0.3'

end
