def fibs(num)
  fib_array = [0, 1]
  i = 0
  until i == (num - 2)
    new_value = fib_array[i] + fib_array[i + 1]
    fib_array.push(new_value)
    i += 1
  end
  p fib_array
end

def fibs_rec(num1, num2, array)
  if num2 == 0 || num2 == 1
    array = [0, 1]
    fibs_rec(num1 - 1, num2 + 1, array)
  elsif num1 == 0
    return array
  else
    array.push(array[-1 - 1] + array[-1]) 
    p "recursive"
    fibs_rec(num1 - 1, num2 + 1, array)
  end
end

fibs(20)
p fibs_rec(20, 0, [])