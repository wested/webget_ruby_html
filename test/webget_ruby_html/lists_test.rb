require 'test/unit'
require 'webget_ruby_html'

class ListsTest < Test::Unit::TestCase

  include HTML

  ITEMS=['a','b','c']

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

end



