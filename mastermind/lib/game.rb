class Game
  attr_reader :game_rules
  
  def initialize(game)
    @board = game
  end

  def game_rules(color_list, red, white)
    puts "\nWelcome to Mastermind!"
    puts "\nHere are the rules of the game:"
    puts "\nFirst, you will select whether you want to be the Code Guesser or the Code Maker"
    puts "\nIf you choose to be the Code Guesser, here is how the game will be played:"
    puts "\n- The computer will choose a code comprised of four\n  colors from the below list of colors:"
    puts " "
    puts color_list
    puts " "
    puts "- The computer can pick any combination from the list\n  of colors, even the same color four times in a row."
    puts "\n- You must then guess a code of four colors, attempting\n  to match what the computer has chosen."
    puts "\n- The computer will then let you know if you got it\n  completely correct or let you know how close you got by:"
    puts "\n    - Returning #{red} for each color that\n      is correct and in the correct spot."
    puts "    - Returning #{white} for each color that\n      is correct but in the incorrect spot."
    puts "\n- You will have 12 rounds to guess the code.  If you\n  guess it in the round limit, you win."
    puts "\n- If you do not guess it in the round limit, the computer wins."
    puts " "
    puts "\nIf you choose to be the Code Maker, here is how the game will be played:"
    puts "\n- You will be prompted to input a code based on the same list of colors above."
    puts "\n- The computer will then have 12 rounds to guess your code."
    puts "\n- You will see the computer's guess, the feedback given, and will be prompted to press enter to go to the next round."
    puts "\n- If the computer guesses correctly within 12 rounds, it wins.  If not, you win."
    puts "\n- Bear in mind, the computer is programmed to be difficult to beat in this mode."
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

  def code_chooser?
    puts "\nWould you like to be the code guesser or the code maker?"
    puts "Input 1 for code guesser and 2 for code maker:"
    puts " "
    input = gets.chomp
    if input == "1"
      return "guesser"
    elsif input == "2"
      return "maker"
    else
      puts"\nInvalid input. Please select a 1 or a 2."
      code_chooser?
    end
  end

  def who_won?(winner_winner_chicken_dinner, computer_choice, maker_guesser)
    if maker_guesser == "guesser"
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
    elsif maker_guesser == "maker"
      if winner_winner_chicken_dinner == true
        puts "\nCongrats, you win!"
        puts "\nThe computer was unable to guess your code."
        puts " "
        puts "Would you like to play again? (Y/N)"
        puts " "
        return gets.chomp
      elsif winner_winner_chicken_dinner == false
        puts "\nDrats, the computer guessed your code (I did program it to be very smart)."
        puts "\nBetter luck next time."
        puts " "
        puts "Would you like to play again? (Y/N)"
        puts " "
        return gets.chomp
      end
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