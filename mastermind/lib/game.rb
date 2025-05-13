class Game
  attr_reader :game_rules
  
  def initialize(game)
    @board = game
  end

  def game_rules(color_list, red, white)
    puts "\nWelcome to Mastermind!"
    puts "\nHere are the rules of the game:"
    puts "\n- The computer will choose a code comprised of four\n  colors from the below list of colors:"
    puts " "
    puts color_list
    puts " "
    puts "- The computer can pick any combination from the list\n  of colors, even the same color four times in a row."
    puts "\n- You must then guess four of the colors attempting\n  to match what the computer has chosen."
    puts "\n- The computer will then let you know if you got it\n  completely correct or let you know how close you got by:"
    puts "\n    - Returning #{red} for each color that\n      is correct and in the correct spot."
    puts "    - Returning #{white} for each color that\n      is correct but in the incorrect spot."
    puts "\n- You will have 12 rounds to guess the code.  If you\n  guess it in the round limit, you win."
    puts "\n- If you do not guess it in the round limit, the computer wins."
    puts "\nReady? (Y/N)"
    puts " "
    return gets.chomp
  end

  def start_game?(rules)
    if rules.downcase == "y" || rules.downcase == "yes"
      " "
    elsif rules.downcase == "n" || rules.downcase == "no"
      puts "\nI'm sorry you don't want to play.  Goodbye for now."
      exit
    else
      puts "I didn't catch that. Please respond with Y or N."
      start_game?(gets.chomp)
    end
  end

  def who_won?(winner_winner_chicken_dinner, computer_choice)
    if winner_winner_chicken_dinner == true
      puts "\nYou got it! Congratulations, you win!"
      puts "Computer choice: "
      puts " "
      puts computer_choice
      puts " "
      puts "Would you like to play again? (Y/N)"
      puts " "
      return gets.chomp
    elsif winner_winner_chicken_dinner == false
      puts "\nI'm sorry, the computer won this time."
      puts "Computer choice: "
      puts " "
      puts computer_choice
      puts " "
      puts "Would you like to play again? (Y/N)"
      puts " "
      return gets.chomp
    end    
  end

  def play_again?(again)
    if again.downcase == "y" || again.downcase == "yes"
      return true
    elsif again.downcase == "n" || again.downcase == "no"
      puts " "
      puts "Okay, goodbye for now."
      return false
    else
      puts " "
      puts "I didn't catch that. Please respond with Y or N."
      puts " "
      play_again?(gets.chomp)
    end
  end

end