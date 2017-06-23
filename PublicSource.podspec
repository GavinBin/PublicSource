

Pod::Spec.new do |s|
  s.name             = 'PublicSource'
  s.version          = '0.1.0'
  s.summary          = 'PublicSource是项目公用的库，包含分类，常用的宏，lib'

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/GavinBin/PublicSource.git'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'klwanshua@163.com' => 'klwanshua@163.com' }
  s.source           = { :git => 'https://github.com/GavinBin/PublicSource.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'
  s.source_files = 'PublicSource/Classes/**/*'

end
