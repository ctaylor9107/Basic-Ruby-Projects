require_relative 'lib/colors.rb'
require_relative 'lib/computer.rb'
require 'colorize'


# instantiate objects

colors = Colors.new
comp = Computer.new("comp")



# create variables

color_list = colors.colors_array
computer_secret_code = comp.secret_code(colors.colors_array)
red_peg = color_list[1]
white_peg = color_list[5]




# game rules

puts "\nWelcome to Mastermind!"
puts "\nHere are the rules of the game:"
puts "\n- The computer will choose a code comprised of four\n  colors from the below list of colors:"
puts " "
puts color_list
puts " "
puts "- The computer can pick any combination from the list\n  of colors, even the same color four times in a row."
puts "\n- You must then guess four of the colors attempting\n  to match what the computer has chosen."
puts "\n- The computer will then let you know if you got it\n  it completely correct or let you know how close you got by:"
puts "\n    - Returning #{red_peg} for each color that\n      is correct and in the correct spot."
puts "    - Returning #{white_peg} for each color that\n      is correct but in the incorrect spot."
puts "\n- You will have 12 rounds to guess the code.  If you\n  get it in the round limit, you win."
puts "\n- If you do not guess it in the round limit, the computer wins."
puts "\nReady? (Y/N)"
puts " "
game_start = gets




