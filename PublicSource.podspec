Pod::Spec.new do |s|
s.name         = "PublicSource"
s.version      = "0.1.0"
s.ios.deployment_target = '6.0'
s.osx.deployment_target = '10.8'
s.platform = :ios, '8.0'
s.summary      = "PublicSource项目公用的代码库"
s.homepage     = "https://github.com/GavinBin/PublicSource.git"
s.license      = "MIT"
s.author           = { 'klwanshua@163.com' => 'wangbingi@yonyou.com' }
s.social_media_url   = "http://weibo.com/exceptions"
s.source       = { :git => "https://github.com/GavinBin/PublicSource.git", :tag => s.version }
s.source_files = 'PublicSource/**/*'
s.requires_arc = true
end
