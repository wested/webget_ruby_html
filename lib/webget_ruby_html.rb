=begin rdoc

= WebGet Ruby Gem: HTML helpers for tables, lists, etc.

Author:: Joel Parker Henderson, joelparkerhenderson@gmail.com
Copyright:: Copyright (c) 2006-2010 Joel Parker Henderson
License:: CreativeCommons License, Non-commercial Share Alike
License:: LGPL, GNU Lesser General Public License

==Changes

1.1.0 add files for lists, misc, tables
1.0.6 add to gemcutter
1.0.5 comment & wrap
1.0.4 tables
1.0.0 lists

=end

['lists','misc','tables'].map{|x|
  require File.dirname(__FILE__) + "/webget_ruby_html/#{x}.rb"
}

