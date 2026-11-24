Pod::Spec.new do |s|
  s.name             = 'device_unique_id'
  s.version          = '0.0.1'
  s.summary          = 'Persistent device unique identifier plugin.'
  s.description      = <<-DESC
Persistent device unique identifier across app reinstalls for iOS using Keychain.
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Company' => 'email@example.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.platform = :ios, '12.0'

  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'
end
