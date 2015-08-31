Pod::Spec.new do |s|
  s.name             = "LayoutSwiftly"
  s.version          = "1.0.0"
  s.summary          = "Layout all of your views in one go with Swift and Autolayout"
  s.description      = <<-DESC
                        Using visual constraints, LayoutSwiftly allows you to set many constraints all at once. This UIView extention works well with any other Autolayout tool out there, as well.
                       DESC

  s.homepage         = "https://github.com/JamieREvans/LayoutSwiftly"
  s.license          = 'MIT'
  s.author           = { "JamieREvans" => "jamie.riley.evans@gmail.com" }
  s.source           = { :git => "https://github.com/JamieREvans/LayoutSwiftly.git", :tag => s.version.to_s }

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
end
