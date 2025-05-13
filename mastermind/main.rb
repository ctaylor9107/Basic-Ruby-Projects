
# files required

require_relative 'lib/colors.rb'
require_relative 'lib/computer.rb'
require_relative 'lib/player.rb'
require_relative 'lib/game.rb'
require 'colorize'



# instantiate objects

colors = Colors.new
comp = Computer.new("comp")
player1 = Player.new("Player 1")
game = Game.new("Mastermind")




# create variables

color_list = colors.colors_array
red_peg = color_list[1]
white_peg = color_list[5]



# play game


game.game_rules(color_list, red_peg, white_peg)

puts ""
puts computer_secret_code = comp.secret_code(colors.colors_array) 
puts ""

i = 1
until i == 13
  puts "Round #{i}"
  player_turn = player1.player_turn(color_list)
  if player_turn == computer_secret_code
    player_win = true
    break
  elsif player_turn != computer_secret_code
    player_win = false
    positions = comp.red_peg_positions(player_turn, computer_secret_code)
    player_check = comp.white_colors_to_check(positions, player_turn)
    computer_check = comp.white_colors_to_check(positions, computer_secret_code)
    computer_response =  comp.computer_response(comp.red_peg(positions, red_peg), comp.white_peg(player_check, computer_check, white_peg))
    puts "\nSorry, that is not the correct code."
    puts "Here is the computer's feedback:"
    puts " "
    puts computer_response
    puts " "
    i += 1
  end
end
puts player_win


# puts guess
# comp.computer_code_match?(guess, computer_secret_code)

# positions = comp.red_peg_positions(guess, computer_secret_code)
# # comp.red_peg(positions, red_peg)

# player_check = comp.white_colors_to_check(positions, guess)
# computer_check = comp.white_colors_to_check(positions, computer_secret_code)
# # comp.white_peg(player_check, computer_check, white_peg)

# puts "\nComputer Response: "
# puts comp.computer_response(comp.red_peg(positions, red_peg), comp.white_peg(player_check, computer_check, white_peg))




