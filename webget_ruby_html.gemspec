Gem::Specification.new do |s|

  NAME		      = 'webget_ruby_html'
  CLASSES             = ['lists','misc','tables']
  MAIN_FILES          = ["lib/#{NAME}.rb"] + CLASSES.map{|c| "lib/#{NAME}/#{c}.rb"}
  TEST_FILES          = ["test/#{NAME}.rb"] + CLASSES.map{|c| "test/#{NAME}/#{c}_test.rb"}
  DATA_FILES          = []
  HELP_FILES	      = ['README.rdoc','LICENSE.txt']

  s.name              = NAME
  s.summary           = "WebGet Ruby Gem: HTML helpers for tables, headers, rows, cells, lists, etc."
  s.version           = "1.1.0"
  s.author            = "WebGet"
  s.email             = "webget@webget.com"
  s.homepage          = "http://webget.com/"
  s.signing_key       = '/home/webget/keys/certs/webget.com.rsa.private.key.and.certificate.pem'
  s.cert_chain        = ['/home/webget/keys/certs/webget.pem']

  s.platform          = Gem::Platform::RUBY
  s.require_path      = 'lib'
  s.has_rdoc          = true
  s.files             = HELP_FILES + MAIN_FILES + TEST_FILES + DATA_FILES
  s.test_files        = TEST_FILES + DATA_FILES

end
