require "json"

package = JSON.parse(File.read(File.expand_path(File.join(__dir__, "..", "info.json"))))
name = "scandit-datacapture-frameworks-parser"
version = package["version"]

Pod::Spec.new do |s|
    s.name                    = name
    s.version                 = version
    s.summary                 = package["descriptions"][name]
    s.homepage                = package["homepages"][name]
    s.license                 = { :type => 'Apache-2.0' , :text => 'Licensed under the Apache License, Version 2.0 (the "License");' }
    s.author                  = { "Scandit" => "support@scandit.com" }
    s.platforms               = { :ios => "15.0" }
    s.source                  = { :git => "https://github.com/Scandit/scandit-datacapture-frameworks-parser.git", :tag => "#{package["version"]}" }
    s.swift_version           = "5.7"
    s.source_files            = "Sources/**/*.{h,m,swift}"
    s.requires_arc            = true
    s.module_name             = "ScanditFrameworksParser"
    s.header_dir              = "ScanditFrameworksParser"

    s.ios.vendored_frameworks = "Frameworks/ScanditParser.xcframework"

    s.dependency "scandit-datacapture-frameworks-core", "= #{version}"
end
