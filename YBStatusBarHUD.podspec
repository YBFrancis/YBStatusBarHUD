Pod::Spec.new do |s|
  s.name         = "YBStatusBarHUD"
  s.version      = "0.0.1"
  s.summary      = "The easy most convenient window HUD"
  s.homepage     = "https://github.com/YBFrancis/YBStatusBarHUD"
  s.license      = "MIT"
  s.platform     = :ios, "6.0"
  s.author             = { "YBFrancis" => "474930305@qq.com"}
  s.social_media_url   = "http://weibo.com/u/5612267220"
  s.source       = { :git => "https://github.com/YBFrancis/YBStatusBarHUD.git", :tag => s.version }
  s.source_files  = "YBStatusBarHUD/**/*"
  s.resource      = "YBStatusBarHUD/YBStatusBarHUD.bundle"
  s.requires_arc  = true
end

