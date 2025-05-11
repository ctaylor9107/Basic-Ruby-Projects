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
  
  
  def computer_code_check(player_code_guess, secret_code)
    if player_code_guess == secret_code
      return true
    elsif player_code_guess != secret_code
      return false
    end
  end
end