# WebGet Ruby Gem: HTML helpers for tables, lists, etc.

module HTML

  # Return the text wrapped in an HTML comment tag.
  # @return [String] text wrapped in an HTML comment tag
  # @param [String] text to be wrapped
  # @example
  #   comment('foo') => "<!--foo-->"
  
  def comment(text)
    "<!--#{text}-->"
  end

  # Return the text wrapped in a tag pair.
  # @return [String] text wrapped in a tag pair.
  # @param [String] text to be wrapped
  # @param [String] tag to use as wrapper
  # @example
  #   wrap('foo','<bar>') => "<bar>foo</bar>"
  #
  # @example
  # you can omit the tag angle brackets
  #   wrap('foo','bar') => "<bar>foo</bar>"
  #
  # @example
  # you can use arbitrary tag attributes
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

  # Builds a string of attributes suitable for HTML
  # 
  # There's likely a better more-standard way to do this.
  # (Method is only used by the #table method.)
  #
  # @return [String] attributes suitable for HTML
  # @option opts [Hash] attributes with values
  # @option keys [Array] select only certain attributes to use in generated string
  # @example
  # With all keys:
  #   hash={:foo'=>'bar',:goo'=>'car',;hoo=>'dar'}
  #   attrs(hash) => ' foo="bar" goo="car" hoo="dar"'
  #   
  # @example
  # With selected keys:
  #   hash={:foo'=>'bar',:goo'=>'car',;hoo=>'dar'}
  #   attrs(hash,[:foo,:hoo]) => ' foo="bar" hoo="dar"'
  
  def attrs_to_string(ops,keys=nil)
   return '' if !ops or ops=={}
   keys||=ops.keys
   return keys.inject(''){|s,k| s = (ops[k] ? s+=" #{k}=\"#{ops[k]}\"" : s)}
  end

end
