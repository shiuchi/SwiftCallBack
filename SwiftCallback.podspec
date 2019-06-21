
Pod::Spec.new do |s|
  s.name         = "SwiftCallback"
  s.version      = "0.0.1"
  s.summary      = "SwiftCallback."

  
  s.description  =  "SwiftCallback"

  s.homepage     = "https://github.com/shiuchi/SwiftCallBack"
  s.license      = "MIT"
  s.author             = { "shiuchi" => "s.shiuchi[at]gmail.com" }
  s.platform     = :ios
  s.platform     = :ios, "10.0"
  s.source       = { :git => "https://github.com/shiuchi/SwiftCallBack" , :tag => s.version.to_s}
  s.source_files  = "ArchaiqueUtils/Classes", "ArchaiqueUtils/Classes/**/*"
  s.requires_arc = true
  s.xcconfig = { 'HEADER_SEARCH_PATHS' => '(inherited)′,′LIBRARYSEARCHPATHS′=>′(inherited)', 'OTHER_LDFLAGS' => '$(inherited)' }
  
  #s.exclude_files = "Classes/Exclude"
  # s.public_header_files = "Classes/**/*.h"
  # s.resource  = "icon.png"
  # s.resources = "Resources/*.png"
  # s.preserve_paths = "FilesToSave", "MoreFilesToSave"
  # s.framework  = "SomeFramework"
  # s.frameworks = "SomeFramework", "AnotherFramework"
  # s.library   = "iconv"
  # s.libraries = "iconv", "xml2"
  
  # s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }

  # s.dependency "JSONKit", "~> 1.4"

end
