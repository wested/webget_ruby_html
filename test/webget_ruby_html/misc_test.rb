require 'test/unit'
require 'webget_ruby_html'

class MiscTest < Test::Unit::TestCase

  include HTML

  def test_comment
    assert_equal("<!--a-->",comment('a'))
  end

  def test_wrap
    assert_equal("<b>a</b>",wrap('a','<b>'))
    assert_equal("<b>a</b>",wrap('a','b'))
    assert_equal("<b c d e>a</b>",wrap('a','b c d e'))
  end

end



