def merge_sort(sort_array)
  if sort_array.length == 1
    return sort_array
  
  else
    a = sort_array.slice!(0, sort_array.length()/2)
    b = sort_array
    new_a = merge_sort(a)
    new_b = merge_sort(b)
    sorted_array = []
    if new_a.length == 1 && new_b.length == 1
      if new_a[0] < new_b[0]
        sorted_array = new_a + new_b
      elsif new_b[0] < new_a[0]
        sorted_array = new_b + new_a
      elsif new_a[0] == new_b[0]
        sorted_array = new_a + new_b
      end
    
    elsif new_a.length > 1 || new_b.length > 1
      if new_a[0] < new_b[0]
        sorted_array.push(new_a.slice!(0))
        next_array = new_a + new_b
        new_sort = merge_sort(next_array)
        sorted_array = sorted_array + new_sort
      elsif new_b[0] < new_a[0]
        sorted_array.push(new_b.slice!(0))
        next_array = new_a + new_b
        new_sort = merge_sort(next_array)
        sorted_array = sorted_array + new_sort
      elsif new_a[0] == new_b[0]
        sorted_array.push(new_a.slice!(0))
        sorted_array.push(new_b.slice!(0))
        new_sort = merge_sort(new_a + new_b)
        sorted_array = sorted_array + new_sort
      end
    end
    return sorted_array
    

  end
end