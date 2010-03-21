
module HTML



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
  #   rows=[['d','e,'f'],['g','h,'i'],['j','k','l']]
  #   table(:id=>'foo', :class=>'bar', :headers=>headers, :footers=>footers, :rows=>rows)
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


end
