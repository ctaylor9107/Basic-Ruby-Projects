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
    puts "\n- You will have 12 rounds to guess the code.  If you\n  geuess it in the round limit, you win."
    puts "\n- If you do not guess it in the round limit, the computer wins."
    puts "\nReady? (Y/N)"
    puts " "
    game_start = gets
  end



end