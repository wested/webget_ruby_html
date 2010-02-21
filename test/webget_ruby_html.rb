require 'test/unit'

['lists','misc','tables'].map{|x|
  require File.dirname(__FILE__) + "/webget_ruby_html/#{x}_test.rb"
}




