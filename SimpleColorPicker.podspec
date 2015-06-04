#
# Be sure to run `pod lib lint SimpleColorPicker.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "SimpleColorPicker"
  s.version          = "0.1.0"
  s.summary          = "A very simple, vertical, snapchat-like, color picker for iOS."
  #s.description      = ""
  s.homepage         = "https://github.com/olshansk/SimpleColorPicker"
  s.screenshots      = "https://raw.githubusercontent.com/Olshansk/SimpleColorPicker/master/Example/SimpleColorPicker.gif"
  s.license          = 'MIT'
  s.author           = { "Daniel Olshansky" => "olshansky.daniel@gmail.com" }
  s.source           = { :git => "https://github.com/olshansk/SimpleColorPicker.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/olshansky'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'SimpleColorPicker' => ['Pod/Assets/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
end
