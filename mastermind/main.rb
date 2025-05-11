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
computer_secret_code = comp.secret_code(colors.colors_array)
red_peg = color_list[1]
white_peg = color_list[5]


# play game

game.game_rules(color_list, red_peg, white_peg)
guess = player1.player_turn(color_list)
puts comp.computer_code_check(guess, computer_secret_code)


