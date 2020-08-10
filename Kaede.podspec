Pod::Spec.new do |spec|
  spec.name         = "Kaede"
  spec.version      = "1.2"
  spec.summary      = "Japanese IME support; Romaji -> Kana -> Kanaji"
  spec.description  = <<-DESC
    Kaede is a project to support Japanese input method.
    You can convert Roman to Hiragana and get a list of candidates that converted Hiragana into Kanji.
  DESC
  spec.homepage     = "https://github.com/Kyome22/Kaede"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author             = { "Takuto Nakamura" => "kyomesuke@icloud.com" }
  spec.social_media_url   = "https://twitter.com/Kyomesuke"
  spec.platform     = :ios
  spec.ios.deployment_target = "13.0"
  spec.source       = { :git => "https://github.com/Kyome22/Kaede.git", :tag => "#{spec.version}" }
  spec.source_files  = "Kaede/**/*.swift"
  spec.swift_version = "5.0"
  spec.resources = "Kaede/**/*.csv"
  spec.requires_arc = true
end
