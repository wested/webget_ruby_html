
module HTML

  # Processes parameters into a complete HTML table
  # @return [String] complete HTML table
  # @param [String] text the complete text of the table, e.g. <table>text</table>
  # @param [Array,String] headers builds the header row from this array
  # @param [Array,String] footers builds the footer row from this array
  # @param [Array,Array] rows builds the data rows from this array of arrays
  # @param [String] class is the table's css class, e.g. :class=>'sortable' 
  # @param [String] id is the table's css id, e.g. :id=>'mytable'
  #
  # @example
  # Build a table with three data rows, each with three columns, plus a header and footer row,
  # giving the table both an ID and class:
  # 
  #   headers = ['a','b','c']
  #   footers = ['x','y','z']
  #   rows=[['d','e,'f'],['g','h,'i'],['j','k','l']]
  #   table(:id=>'foo', :class=>'bar', :headers=>headers, :footers=>footers, :rows=>rows)
  #
  # Gets this HTML
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
  #   <th>x</th>
  #   <th>y</th>
  #   <th>z</th>
  #   </tr>
  #   </tfoot>
  #   </table>
  #
  # Special Cases
  #
  # If headers, row or footers are nil, then they're skipped.
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


  # @option ops [Array,String] :texts, array of strings creates an HTML table for each element and returns the concatenated string
  # @return [String] concatenated string of HTML tables
  # @example
  #   tables(['table1','table2']) =>
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


  # Returns the _thead_ row for a table
  # @return [String] thead row of a table
  # @param [Array,String] headers array of strings to use as column headers
  # @example
  #   thead(['a','b','c]) =>
  #   <thead>
  #   <th>a</th>
  #   <th>b</th>
  #   <th>c</th>
  #   </thead>

  def thead(headers)
    "<thead>\n" + tr(ths(headers)) + "</thead>\n"
  end


  # Returns a single _th_ cell
  # @return [String] single th cell
  # @param [String] header text to use
  # @example
  #   th('Name') =>
  #   <th>header</th>
 
  def th(header)
    "<th>" + header.to_s + "</th>\n"
  end


  # Returns a string of _th_ cells
  # @return [String] string of th cells
  # @param [Array,String] header texts to use
  # @example
  #   ths(['a','b','c]) =>
  #   <th>a</th>
  #   <th>b</th>
  #   <th>c</th>

  def ths(headers)
    headers.map{|x| th(x)}.join
  end


  # Returns the _tbody_ element of a table
  # @return [String] tbody of a table
  # @param [Array,String] row array of strings to build table's data rows
  # @example
  #   tbody([['d','e,'f'],['g','h,'i'],['j','k','l']]) =>
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
  
  def tbody(rows)
    "<tbody>\n" + trs(rows) + "</tbody>\n"
  end


  # Returns a single table row
  # @return [String] single tr string
  # @param [String,Enumerable] row text to use or enumerable (array, hash, etc) to iterate over to build string from
  # @example
  # Simple use:
  #   tr('<td>a</td><td>b</td><td>c</td>') =>
  #   <tr>
  #   <td>a</td><td>b</td><td>c</td>
  #   </tr>
  #
  # Enumerable usage:
  #   tr(['<td>a</td><td>b</td><td>c</td>','<td>d</td><td>e</td><td>f</td>','<td>g</td><td>h</td><td>i</td>']) =>
  #   <tr>
  #   <td><td>a</td><td>b</td><td>c</td></td>
  #   <td><td>d</td><td>e</td><td>f</td></td>
  #   <td><td>g</td><td>h</td><td>i</td></td>
  #   </tr>

  def tr(row)
    "<tr>\n" + (row.is_a?(String) ? row : row.is_a?(Enumerable) ? tds(row) : row.to_s) + "</tr>\n"
  end


  # Returns a string of table rows
  # @return [String] concatenated tr string
  # @param [Array,String,Enumerable] rows text to use or enumerable (array, hash, etc) to iterate over to build string from
  # @example
  #   trs(['<td>a</td><td>b</td><td>c</td>','<td>d</td><td>e</td><td>f</td>','<td>g</td><td>h</td><td>i</td>']) =>
  #   <tr><td><td>a</td><td>b</td><td>c</td></td></tr>
  #   <tr><td><td>d</td><td>e</td><td>f</td></td></tr>
  #   <tr><td><td>g</td><td>h</td><td>i</td></td></tr>

  def trs(rows)
    rows.map{|x| tr(x)}.join
  end


  # Returns a single _td_ cell
  # @return [String] single td cell
  # @param [Object] cell content, can be any data type which implements to_s, to use
  # @example
  #   td(42) =>
  #   <td>42</td>
 
  def td(cell)
    "<td>" + cell.to_s + "</td>\n"
  end


  # Returns a concatenated string of _td_ cells
  # @return [String] single td cell
  # @param [Enumerable] cell contents, can be any data type which implements to_s, to use
  # @example
  #   tds([42,'restaurant','Arthur Dent']) =>
  #   <td>42</td>
  #   <td>restaurant</td>
  #   <td>Arthur Dent</td>

  def tds(cells)
    cells.map{|x| td(x)}.join
  end


  # Returns the _tfoot_ row for a table
  # @return [String] tfoot row of a table
  # @param [Array,Object] footers array of items, can be any data type which implements to_s, to use as table footer row
  # @example
  # Total up money columns, leave others blank
  #   tfoot(['Totals','','','$314,159','$26,703.51','$340,862.51'],'') =>
  #   <tfoot>
  #   <th>
  #   <th>Totals</th>
  #   <th></th>
  #   <th></th>
  #   <th>$314,159</th>
  #   <th>$26,703.51</th>
  #   <th>$340,862.51</th>
  #   <th></th>
  #   </tfoot>

  def tfoot(footers)
    "<tfoot>\n" + tr(ths(footers)) + "</tfoot>\n"
  end


end
