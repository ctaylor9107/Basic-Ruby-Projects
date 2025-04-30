def bubble_sort(sort_array)

  i = 0
  until i == sort_array.length

    if i == 0
      limit = sort_array.length
    elsif i > 0
      limit = (sort_array.length - i)
    end

    k = 0
    until k > limit

      if k < (limit - 1) && (sort_array[k] > sort_array[k + 1])
        sort_amount = sort_array[k]
        sort_array[k] = sort_array[k + 1]
        sort_array[k + 1] = sort_amount
        k += 1
      elsif k == limit
        i += 1
        k += 1
      else
        k += 1
      end
    end
  end

  sort_array
  
end