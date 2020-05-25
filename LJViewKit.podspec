#
# Be sure to run `pod lib lint LJViewKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'LJViewKit'
  s.version          = '2.2.6'
  s.summary          = 'View大小变化监听'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/lijian096870/LJViewKit'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { '1358756992@qq.com' => 'enigma.lj@webi.com.cn' }
  s.source           = { :git => 'https://github.com/lijian096870/LJViewKit.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.source_files = 'LJViewKit/Classes/**/*'
  

s.public_header_files = 'LJViewKit/Classes/LJViewKit.h'

s.frameworks = 'UIKit'
end
