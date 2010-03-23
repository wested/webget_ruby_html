
module HTML

  # Wrap each item in passed arrays of stringifiable items as a list, each item in _li_ tags, the whole list in _ul_ tags
  # @return [String] list of items wrapped in _ul_ tags
  # @param [Enumerable,Objects] lists of items, each item can be any data type which implements to_s, to wrap
  # @example
  # passed list is a string
  #   ul('list') =>
  #   <ul>
  #   list
  #   </ul>
  #
  # @example
  # passed list is enumerable
  #   ul([1,2,3]) =>
  #   <ul>
  #   <li>list[1]</li>
  #   <li>list[2]</li>
  #   <li>list[3]</li>
  #   </ul>
 
  def ul(list)
    "<ul>\n" + (list.is_a?(String) ? list : list.is_a?(Enumerable) ? lis(list) : list.to_s) + "</ul>\n"
  end

  
  # Wrap each item in passed array of arrays of stringifiable items as a list, each item in _li_ tags, each sub-array in _ul_ tags
  # @return [String] passed array of lists wrapped in _ul_ tags
  # @param [Array,Objects] lists of items, each item can be any data type which implements to_s, to wrap
  #
  # @example
  #   uls([1,2,3],[4,5,6],[7,8,9]) =>
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


  # Wrap item in _li_ tags
  # @return [String] passed item wrapped in li tags
  # @param [Object] item, can be any data type which implements to_s, to wrap
  # 
  # @example
  #   li('item') => <li>item</li>
 
  def li(item)
    "<li>" + item.to_s + "</li>\n"
  end

  # Wrap each item in a list in _li_ tags
  # @return [String] passed items wrapped in li tags and concatenated
  # @param [Array,Objects] items, can be any data type which implements to_s, to wrap
  #
  # @example
  #   lis([1,2,3]) =>
  #   <li>item[0]</li>
  #   <li>item[1]</li>
  #   <li>item[2]</li>

  def lis(items)
    items.map{|x| li(x)}.join
  end


end
