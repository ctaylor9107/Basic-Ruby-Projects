class Computer
  
  def initialize(computer)
    @computer = computer
  end

  
  def secret_code(color_list)
    computer_secret_code = []
    while computer_secret_code.length < 4
      num = rand(6)
      computer_secret_code.push(color_list[num])
    end
    computer_secret_code
  end

  def red_peg_positions(player_code_guess, secret_code)
    new_code = []
    player_code_guess.each_with_index do |color, index|
      if color == secret_code[index]
        new_code.push(index)
      end
    end
    return new_code
  end


  def red_peg(positions, red)
    red_pegs = []
    positions.each { |value| red_pegs.push(red)}
    return red_pegs
  end


  def white_colors_to_check(positions, function)
    function.select.with_index { |color, index| positions.include?(index) == false}
  end


  def white_peg(player_check, computer_check, white)
    white_pegs = []
    player_check.each do | color |
      if computer_check.include?(color)
        white_pegs.push(white)
        computer_check.slice!(computer_check.find_index { |value| value == color})
      else
        ""
      end
    end
    return white_pegs
  end

  def white_peg_positions(computer_check, player_check)
    colors = []
    computer_check.each do | color |
      if player_check.include?(color)
        colors.push(color)
        player_check.slice!(player_check.find_index { |value| value == color})
      else
        ""
      end
    end
    return colors
  end


  def computer_response(red_peg, white_peg)
    return red_peg + white_peg
  end

  def computer_response_v2(positions, white_peg_positions, red, white)
    response = []
    positions.each { | value | response.push(red)}
    white_peg_positions.each{ | value | response.push(white)}
    return response
  end

  def red_peg_array(positions, computer_guess)
    color_array = ["color", "color", "color", "color"]
    color_array.each_with_index do | value, index | 
      if positions.include?(index)
        color_array[index] = computer_guess[index]
      else
        " "
      end
    end
    return color_array
  end

  def white_peg_changes(red_peg_array, white_peg_colors, computer_guess)
    red_peg_array.each_with_index do | value, index |
      if value == "color" && white_peg_colors.include?(computer_guess[index]) == true
        i = 0
        until i == 4
          if red_peg_array[i] == "color" && i != index
            red_peg_array[i] = computer_guess[index]
            break
          else
          i += 1
          end
        end
        white_peg_colors.slice!(white_peg_colors.find_index { | value | value == computer_guess[index]})
      end
    end
    return red_peg_array
  end

  def computer_next_guess(white_peg_changes, color_list)
    white_peg_changes.each_with_index do | value, index |
      if value == "color"
        white_peg_changes[index] = color_list[rand(6)]
      end
    end
    return white_peg_changes
  end

end