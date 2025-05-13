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
  

  def computer_code_match?(player_code_guess, secret_code)
    if player_code_guess == secret_code
      return true
    elsif player_code_guess != secret_code
      return false
    end
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
    positions.each { |value| puts red}
  end


  def white_colors_to_check(positions, function)
    function.select.with_index { |color, index| positions.include?(index) == false}
  end


  def white_peg(player_check, computer_check, white)
    player_check.each do | color |
      if computer_check.include?(color)
        puts white
        computer_check.slice!(computer_check.find_index { |value| value == color})
      else
        ""
      end
    end
  end


end
