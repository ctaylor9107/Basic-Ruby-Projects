def caesar_cipher(string, num)
  cipher_letters = string.split("")
  cipher_numbers = cipher_letters.map { |letter| letter.ord}



  updated_cipher_numbers = cipher_numbers.map do |digit|

    if digit >= 97 && digit <= 122

      i = num
      until i == 0
        if digit >= 97 && digit <= 121
          i -= 1
          digit += 1
        elsif digit == 122
          i -= 1
          digit = 97
        end
      end
      digit

    elsif digit >= 65 && digit <= 90

      i = num
      until i == 0
        if digit >= 65 && digit <= 89
          i -= 1
          digit += 1
        elsif digit == 90
          i -= 1
          digit = 65
        end
      end
      digit

    else
      digit

    end
  end

  new_array = updated_cipher_numbers.map { |number| number.chr}

  p new_array.join
end
