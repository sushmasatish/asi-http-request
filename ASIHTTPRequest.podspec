Pod::Spec.new do |s|
  s.name     = 'ASIHTTPRequest'
  s.version  = '1.0'
  s.summary  = 'Easy to use CFNetwork wrapper for HTTP requests, Objective-C, Mac OS X and iPhone'
  s.homepage = 'http://allseeing-i.com/ASIHTTPRequest'
  s.author   = { 'Ben Copsey' => 'ben@allseeing-i.com' }
  s.source   = { :git => 'https://github.com/pokeb/asi-http-request.git', :tag => 'v1.0' }

  s.description = %{
    ASIHTTPRequest is an easy to use wrapper around the CFNetwork API that
    makes some of the more tedious aspects of communicating with web servers
    easier. It is written in Objective-C and works in both Mac OS X and iPhone
    applications.

    It is suitable performing basic HTTP requests and interacting with
    REST-based services (GET / POST / PUT / DELETE). The included
    ASIFormDataRequest subclass makes it easy to submit POST data and files
    using multipart/form-data.
  }
  
  s.license = "New BSD License"
  s.requires_arc = 'false'
  s.source_files = 'Classes'

  s.dependency 'Reachability'

  s.subspec 'Core' do |core|
    core.source_files = 'Classes/*.{h,m}'
    core.ios.dependencies = 'Reachability'
    core.ios.frameworks = 'MobileCoreServices','CFNetwork','CoreGraphics'
    core.osx.exclude_files = '**/*ASIAuthenticationDialog*'
    core.osx.frameworks = 'SystemConfiguration','CoreServices'
    core.libraries = 'z.1'
  end

end
