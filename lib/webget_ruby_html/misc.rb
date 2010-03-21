

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
