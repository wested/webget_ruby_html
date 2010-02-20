=begin rdoc

= WebGet Ruby Gem: HTML helpers for tables, lists, etc.

Author:: Joel Parker Henderson, joelparkerhenderson@gmail.com
Copyright:: Copyright (c) 2006-2010 Joel Parker Henderson
License:: CreativeCommons License, Non-commercial Share Alike
License:: LGPL, GNU Lesser General Public License

==Changes

1.0.6 add to gemcutter
1.0.5 comment & wrap
1.0.4 tables
1.0.0 lists

=end

module HTML

  # Return the text wrapped in a comment.
  #
  # ==Example
  #   comment('foo') => "<!--foo-->"
  
  def comment(text)
    "<!--#{text}-->"
  end

  # Return the text wrapped in a tag pair.
  #
  # ==Example
  #   wrap('foo','<bar>') => "<bar>foo</bar>"
  #
  # ==Example: you can omit the tag angle brackets
  #   wrap('foo','bar') => "<bar>foo</bar>"
  #
  # ==Example: you can use arbitrary tag attributes
  #   wrap('foo','<bar x="1" y="2">') => "<bar x=1 y=2>foo</bar>"
  #

  def wrap(text,tag)
    t=tag
    t.sub!(/^</,'')
    t.sub!(/>$/,'')
    open=t
    shut=t.split.first
    "<#{open}>#{text}</#{shut}>"
  end


  # Options:
  #   :text : the complete text of the table, e.g. <table>text</table>
  #   :headers
  #   :footers
  #   :rows
  #   :class is the table's css class, e.g. :class=>'sortable' 
  #   :id is the table's css id, e.g. :id=>'mytable'
  #
  # ==Example
  #   headers = ['a','b','c']
  #   footers = ['x','y','z']
  #   rows=[['d','e,'f'],['g','h,'i'],['j','k','l']
  #   table(:id=>'foo', :class=>'bar', :headers=>headers, :footers=>footers, :rows=>rows
  #
  # ==Return HTML
  #   <table id="foo" class="bar">
  #   <thead>
  #   <tr>
  #   <th>a</th>
  #   <th>b</th>
  #   <th>c</th>
  #   </tr>
  #   </thead>
  #   <tbody>
  #   <tr>
  #   <td>d</td>
  #   <td>e</td>
  #   <td>f</td>
  #   </tr>
  #   <tr>
  #   <td>g</td>
  #   <td>h</td>
  #   <td>i</td>
  #   </tr>
  #   <tr>
  #   <td>j</td>
  #   <td>k</td>
  #   <td>l</td>
  #   </tr>
  #   </tbody>
  #   <tfoot>
  #   <tr>
  #   <th>
  #   <th>x</th>
  #   <th>y</th>
  #   <th>z</th>
  #   </tr>
  #   </tfoot>
  #   </table>
  #
  # ==Special cases
  #
  # If headers or row or footers are nil, then this skips them.
  # 
  # If footers==[] then this method will use a footers array
  # with blanks that is the same length as the headers array.
  
  def table(ops={})
    text=ops[:text]
    if !text
     headers=ops[:headers]
     footers=(defined?(ops[:footers]) ? ((ops[:footers]==true) ? Array.new(headers.size,'') : ops[:footers]) : false)
     rows=ops[:rows]
     text=((headers ? thead(headers) : '') + (rows ? tbody(rows) : '') + (footers ? tfoot(footers) : ''))
    end
    return "<table#{attrs_to_string(ops,[:id,:class])}>\n" + text + "</table>\n"
  end


  # Options:
  #   :texts
  #
  # Return:
  #   <table>
  #   texts[0]
  #   </table>
  #   <table>
  #   texts[0]
  #   </table>
  #   ...
 
  def tables(ops={})
    ops[:texts].map{|text| table(ops.merge(:text=>text))}.join
  end


  # Return:
  #   <thead>
  #   <th>header[0]</th>
  #   <th>header[1]</th>
  #   <th>header[2]</th>
  #   </thead>

  def thead(headers)
    "<thead>\n" + tr(ths(headers)) + "</thead>\n"
  end


  # Return:
  #   <th>header</th>
 
  def th(header)
    "<th>" + header.to_s + "</th>\n"
  end


  # Return:
  #   <th>header[0]</th>
  #   <th>header[1]</th>
  #   <th>header[2]</th>

  def ths(headers)
    headers.map{|x| th(x)}.join
  end


  # Return:
  #   <tbody>
  #   <tr>
  #   <td>row[0][0]</td>
  #   <td>row[0][1]</td>
  #   <td>row[0][2]</td>
  #   </tr>
  #   <tr>
  #   <td>row[1][0]</td>
  #   <td>row[1][1]</td>
  #   <td>row[1][2]</td>
  #   </tr>
  #   <tr>
  #   <td>row[2][0]</td>
  #   <td>row[2][1]</td>
  #   <td>row[2][2]</td>
  #   </tr>
  #   </tbody>
  
  def tbody(rows)
    "<tbody>\n" + trs(rows) + "</tbody>\n"
  end


  # Return:
  #  <tr>
  #  row
  #  </tr>
  #
  # Return when row is enumerable:
  #   <tr>
  #   <td>row[0]</td>
  #   <td>row[1]</td>
  #   <td>row[2]</td>
  #   </tr>

  def tr(row)
    "<tr>\n" + (row.is_a?(String) ? row : row.is_a?(Enumerable) ? tds(row) : row.to_s) + "</tr>\n"
  end


  # Return:
  #   <tr>
  #   <td>row[0][0]</td>
  #   <td>row[0][1]</td>
  #   <td>row[0][2]</td>
  #   </tr>
  #   <tr>
  #   <td>row[1][0]</td>
  #   <td>row[1][1]</td>
  #   <td>row[1][2]</td>
  #   </tr>
  #   <tr>
  #   <td>row[2][0]</td>
  #   <td>row[2][1]</td>
  #   <td>row[2][2]</td>
  #   </tr>

  def trs(rows)
    rows.map{|x| tr(x)}.join
  end


  # Return:
  #   <td>cell</td>
 
  def td(cell)
    "<td>" + cell.to_s + "</td>\n"
  end


  # Return:
  #   <td>cells[0]</td>
  #   <td>cells[1]</td>
  #   <td>cells[2]</td>

  def tds(cells)
    cells.map{|x| td(x)}.join
  end


  # Return:
  #   <tfoot>
  #   <th>
  #   <th>footer[0]</th>
  #   <th>footer[1]</th>
  #   <th>footer[2]</th>
  #   </tfoot>

  def tfoot(footers)
    "<tfoot>\n" + tr(ths(footers)) + "</tfoot>\n"
  end


  # Return:
  #   <ul>
  #   list
  #   </ul>
  #
  # Return when list is enumerable:
  #   <ul>
  #   <li>list[1]</li>
  #   <li>list[2]</li>
  #   <li>list[3]</li>
  #   </ul>
 
  def ul(list)
    "<ul>\n" + (list.is_a?(String) ? list : list.is_a?(Enumerable) ? lis(list) : list.to_s) + "</ul>\n"
  end

  
  # Return:
  #   <ul>
  #   <li>list[0][1]</li>
  #   <li>list[0][2]</li>
  #   <li>list[0][3]</li>
  #   </ul>
  #   <ul>
  #   <li>list[1][1]</li>
  #   <li>list[1][2]</li>
  #   <li>list[1][3]</li>
  #   </ul>
  #   <ul>
  #   <li>list[2][1]</li>
  #   <li>list[2][2]</li>
  #   <li>list[2][3]</li>
  #   </ul>

  def uls(lists)
   lists.map{|x| ul(x)}.join
  end 


  # Return:
  #   <li>item</li>
 
  def li(item)
    "<li>" + item.to_s + "</li>\n"
  end


  # Return: 
  #   <li>item[0]</li>
  #   <li>item[1]</li>
  #   <li>item[2]</li>

  def lis(items)
    items.map{|x| li(x)}.join
  end



  protected

  # There's likely a better more-standard way to do this.
  #
  # This method is only used by the #table method.
  #
  # Return a string of the attributes suitable for HTML
  #
  # ==Example
  #   hash={:foo'=>'bar',:goo'=>'car',;hoo=>'dar'}
  #   attrs(hash) => ' foo="bar" goo="car" hoo="dar"'
  #   
  # ==Example with selected keys
  #   hash={:foo'=>'bar',:goo'=>'car',;hoo=>'dar'}
  #   attrs(hash,[:foo,:hoo]) => ' foo="bar" hoo="dar"'
  
  def attrs_to_string(ops,keys=nil)
   return '' if !ops or ops=={}
   keys||=ops.keys
   return keys.inject(''){|s,k| s = (ops[k] ? s+=" #{k}=\"#{ops[k]}\"" : s)}
  end

end
