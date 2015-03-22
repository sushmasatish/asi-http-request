Pod::Spec.new do |s|
  s.name     = 'ASIHTTPRequest'
  s.version  = '1.0'
  s.summary  = 'Easy to use CFNetwork wrapper for HTTP requests, Objective-C, Mac OS X and iPhone'
  s.homepage = 'http://allseeing-i.com/ASIHTTPRequest'
  s.author   = { 'Sushma Satish' => 'sushmasatish@gmail.com' }
  s.license = "New BSD License"
  s.source   = { :git => 'https://github.com/sushmasatish/asi-http-request.git', :tag => 'v1.0' }

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
   
  s.requires_arc = false

  s.subspec 'Core' do |core|
    core.source_files = 'Classes/*.{h,m}'
    core.ios.dependency 'Reachability'
    core.ios.frameworks = 'MobileCoreServices','CFNetwork','CoreGraphics'
    core.osx.exclude_files = '**/*ASIAuthenticationDialog*'
    core.osx.frameworks = 'SystemConfiguration','CoreServices'
    core.libraries = 'z.1'
  end

  s.subspec 'ASIWebPageRequest' do |asiWebPageRequest|
	  asiWebPageRequest.source_files = 'Classes/ASIWebPageRequest/*.{h,m}'
	  asiWebPageRequest.libraries = 'xml2.2'
	  asiWebPageRequest.xcconfig = { "HEADER_SEARCH_PATHS" => "\"$(SDKROOT)/usr/include/libxml2\"" }
	  asiWebPageRequest.dependency 'ASIHTTPRequest/Core'
  end

  s.subspec 'CloudFiles' do |cloudFiles|
    cloudFiles.source_files = 'Classes/CloudFiles/*.{h,m}','Classes/S3/ASINSXMLParserCompat.h'
	  cloudFiles.dependency 'ASIHTTPRequest/Core'
  end

  s.subspec 'S3' do |s3|
    s3.source_files = 'Classes/S3/*.{h,m}'
	  s3.dependency 'ASIHTTPRequest/Core'
  end
end
