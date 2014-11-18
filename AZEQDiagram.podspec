#
# Be sure to run `pod lib lint AZEQDiagram.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "AZEQDiagram"
  s.version          = "0.1.1"
  s.summary          = "假 EQ 图"
  s.description      = <<-DESC
  使用 Facebook 的 POP 库实现的假 EQ 图
                       DESC
  s.homepage         = "https://github.com/windless/AZEQDiagram"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Abner Zhong" => "windlessg@gmail.com" }
  s.source           = { :git => "https://github.com/windless/AZEQDiagram.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/windlessaz'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes'
  s.resource_bundles = {
    'AZEQDiagram' => ['Pod/Assets/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  s.dependency 'pop', '~> 1.0.7'
end
