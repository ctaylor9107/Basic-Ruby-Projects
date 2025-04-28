def stock_picker(stock_array)

  day_range_and_amount = {}

  stock_array.each_with_index do |number, index|
    i = (index + 1)
    until i == stock_array.length
      day_range_and_amount[[index, i]] = (number - stock_array[i])
      i += 1
    end
  end
  p day_range_and_amount
end