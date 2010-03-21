
module HTML

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


end
