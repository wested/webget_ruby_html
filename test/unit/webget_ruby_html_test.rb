require 'test/unit'
require 'webget_ruby_html'

class Testing < Test::Unit::TestCase

 include HTML

  # Mock Inputs
  CELLS=['a','b','c']
  ITEMS=['a','b','c']
  ROWS=[['a','b','c'],['d','e','f'],['g','h','i']]

  def test_comment
    assert_equal("<!--a-->",comment('a'))
  end

  def test_wrap
    assert_equal("<b>a</b>",wrap('a','<b>'))
    assert_equal("<b>a</b>",wrap('a','b'))
    assert_equal("<b c d e>a</b>",wrap('a','b c d e'))
  end

  def test_li
    assert_equal("<li>a</li>\n",li('a'))
  end

  def test_lis
    assert_equal("<li>a</li>\n<li>b</li>\n<li>c</li>\n",lis(ITEMS))
  end

  def test_ul
    assert_equal("<ul>\n<li>a</li>\n<li>b</li>\n<li>c</li>\n</ul>\n",ul(ITEMS))
  end

  def test_uls
    assert_equal("<ul>\n<li>a</li>\n<li>b</li>\n<li>c</li>\n</ul>\n<ul>\n<li>a</li>\n<li>b</li>\n<li>c</li>\n</ul>\n",uls([ITEMS,ITEMS]))
  end

  def test_td
    assert_equal("<td>a</td>\n",td('a'))
  end

  def test_tds
    assert_equal("<td>a</td>\n<td>b</td>\n<td>c</td>\n",tds(CELLS))
  end

  def test_tr
    assert_equal("<tr>\n<td>a</td>\n<td>b</td>\n<td>c</td>\n</tr>\n",tr(CELLS))
  end

  def test_trs
    assert_equal("<tr>\n<td>a</td>\n<td>b</td>\n<td>c</td>\n</tr>\n<tr>\n<td>d</td>\n<td>e</td>\n<td>f</td>\n</tr>\n<tr>\n<td>g</td>\n<td>h</td>\n<td>i</td>\n</tr>\n",trs(ROWS))
  end

  def test_tbody
    assert_equal("<tbody>\n<tr>\n<td>a</td>\n<td>b</td>\n<td>c</td>\n</tr>\n<tr>\n<td>d</td>\n<td>e</td>\n<td>f</td>\n</tr>\n<tr>\n<td>g</td>\n<td>h</td>\n<td>i</td>\n</tr>\n</tbody>\n",tbody(ROWS))
  end

  def test_ths
    assert_equal("<th>a</th>\n<th>b</th>\n<th>c</th>\n",ths(CELLS))
  end

  def test_thead(headers)
    assert_equal("<thead>\n<tr>\n<th>a</th>\n<th>b</th>\n<th>c</th>\n</tr>\n</thead>",thead(CELLS))
  end

  def test_tfoot
    assert_equal("<tfoot>\n<tr>\n<th>a</th>\n<th>b</th>\n<th>c</th>\n</tr>\n</tfoot>\n",tfoot(CELLS))
  end

  def test_table_text
    assert_equal("<table>\nfoo</table>\n",table(:text=>'foo'))
  end

  def test_table_text_and_attrs
    assert_equal("<table id=\"foo\" class=\"bar\">\nfoo</table>\n",table(:id=>'foo',:class=>'bar',:text=>'foo'))
  end

  def test_tables
    assert_equal("<table>\nfoo</table>\n<table>\nbar</table>\n",tables(:texts=>['foo','bar']))
  end

  def test_table_headers_body_footers
    assert_equal(
      "<table>\n"+
      "<thead>\n<tr>\n<th>a</th>\n<th>b</th>\n<th>c</th>\n</tr>\n</thead>\n"+
      "<tbody>\n<tr>\n<td>a</td>\n<td>b</td>\n<td>c</td>\n</tr>\n<tr>\n<td>d</td>\n<td>e</td>\n<td>f</td>\n</tr>\n<tr>\n<td>g</td>\n<td>h</td>\n<td>i</td>\n</tr>\n</tbody>\n"+
      "<tfoot>\n<tr>\n<th>a</th>\n<th>b</th>\n<th>c</th>\n</tr>\n</tfoot>\n"+
      "</table>\n",
      table(:headers=>CELLS,:rows=>ROWS,:footers=>CELLS)
    )
  end

end



