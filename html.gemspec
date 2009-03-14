Gem::Specification.new do |s|

  s.name              = "webget_ruby_html"
  s.summary           = "WebGet.com Ruby HTML helpers for tables, headers, rows, cells, lists, etc."
  s.version           = "1.0.4"
  s.author            = "WebGet"
  s.email             = "webget@webget.com"
  s.homepage          = "http://webget.com/"
  s.signing_key       = '/home/webget/keys/certs/webget.com.rsa.private.key.and.certificate.pem'
  s.cert_chain        = ['/home/webget/keys/certs/webget.pem']

  s.platform          = Gem::Platform::RUBY
  s.require_path      = 'lib'
  s.has_rdoc          = true
  s.files             = ['lib/html.rb']
  s.test_files        = ['test/unit/html_test.rb']

end
