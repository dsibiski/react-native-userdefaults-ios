require 'json'

package = JSON.parse(File.read(File.join(__dir__, 'package.json')))

Pod::Spec.new do |s|
  s.name         = "RNUserDefaultsIOS"
  s.version      = package["version"]
  s.summary      = package["description"]

  s.homepage     = "https://github.com/dsibiski/react-native-userdefaults-ios"

  s.license      = "MIT"
  s.authors      = { "Dave Sibiski" => "dsibiski@gmail.com" }
  s.platform     = :ios, "7.0"

  s.source       = { :git => "https://github.com/dsibiski/react-native-userdefaults-ios.git" }
  s.source_files  = "RNUserDefaultsIOS/*.{h,m}"

  s.dependency 'React'
end
