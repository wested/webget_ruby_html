=begin rdoc

= WebGet Ruby Gem: HTML helpers for tables, lists, etc.

Author:: Joel Parker Henderson, joelparkerhenderson@gmail.com
Copyright:: Copyright (c) 2006-2010 Joel Parker Henderson
License:: CreativeCommons License, Non-commercial Share Alike
License:: LGPL, GNU Lesser General Public License

== Table Methods

* table - Builds an HTML table from the supplied parameters: string CSS: ID, Class; array of strings: Headers, Footers; array of array of string: Rows
* tables - Builds one or more HTML tables from a supplied array of arrays (each sub-array holding the params specified for the table method)
* thead - Builds the thead section of a table from an array of strings
* th - Returns a TH table cell
* ths - Returns a string of TH table cells
* tbody - Builds the tbody section of a table from an array of arrays of strings (each sub-array becomes a table row)
* tr - Returns a TR table row
* trs - Returns a string of TR table rows
* td - Returns a TD table cell
* tds - Returns a string of TD table cells
* tfoot - Builds the tfoot section of a table from an array of strings

Examples:
  headers = ['a','b','c']
  footers = ['x','y','z']
  rows=[['d','e,'f']]
  table(:id=>'foo', :class=>'bar', :headers=>headers, :footers=>footers, :rows=>rows)
  =>
  <table id="foo" class="bar">
  <thead>
  <tr>
  <th>a</th>
  <th>b</th>
  <th>c</th>
  </tr>
  </thead>
  <tbody>
  <tr>
  <td>d</td>
  <td>e</td>
  <td>f</td>
  </tr>
  </tbody>
  <tfoot>
  <tr>
  <th>x</th>
  <th>y</th>
  <th>z</th>
  </tr>
  </tfoot>
  </table>


== List Methods

* ul - Builds an HTML unordered list from an array of strings or Enumerables
* uls - Builds one or more HTML unordered lists from an array of arrays of strings or Enumerables (sub-arrays can be a mix of both)
* li - Returns an LI item
* lis - Returns a string of LI items

Examples:
  ul(['a','b','c']) =>
  <ul><li>a</li><li>b</li><li>c</li></ul>
  
  uls(['a','b','c'],['d','e','f'],[1,2,3]) =>
  <ul><li>a</li><li>b</li><li>c</li></ul><ul><li>d</li><li>e</li><li>f</li></ul><ul><li>1</li><li>2</li><li>3</li></ul>

==  Misc Methods

* comment - Return the text parameter wrapped in an HTML comment
* wrap - Return the text parameter wrapped in a tag pair

Examples:
  comment('the following comes from') =>
  <!-- the following comes from -->
  
  wrap('foo', 'bar') =>
  <bar>foo</bar>

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

