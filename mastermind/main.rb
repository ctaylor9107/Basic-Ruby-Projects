
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


rules = game.game_rules(color_list, red_peg, white_peg)

game.start_game?(rules)

puts ""

play_game = true
until play_game == false
  player_choice = game.code_chooser?
  if player_choice == "guesser"

    computer_secret_code = comp.secret_code(colors.colors_array) 
    puts ""
    i = 1
    until i == 13
      puts "Round #{i}"
      player_turn = player1.player_turn(color_list, "guess")
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

  elsif player_choice == "maker"
    puts "\nPlease create a secret code of four colors using the below:"
    puts " "
    player_code = player1.player_turn(color_list, "code")
    puts " "
    puts player_code
    i = 1
    next_guess = []
    until i == 13
      puts "\nRound #{i}"
      if i == 1
        computer_guess = comp.secret_code(color_list)
        i += 1
      elsif i > 1
        computer_guess = next_guess
        i += 1
      end

      if player_code == computer_guess
        player_win = false
        puts "\nComputer guess:"
        puts computer_guess
        break
      elsif player_code != computer_guess
        player_win = true
        positions = comp.red_peg_positions(computer_guess, player_code)
        player_check = comp.white_colors_to_check(positions, player_code)
        computer_check = comp.white_colors_to_check(positions, computer_guess)
        white_peg_colors = comp.white_peg_positions(computer_check, player_check)
        red_peg_array = comp.red_peg_array(positions, computer_guess)
        guess_feedback = comp.computer_response_v2(positions, white_peg_colors, red_peg, white_peg)
        almost_done = comp.white_peg_changes(red_peg_array, white_peg_colors, computer_guess)
        # guess_feedback = comp.computer_response(comp.red_peg(positions, red_peg), comp.white_peg(computer_check, player_check, white_peg))
        # guess_feedback = comp.computer_response_v2(positions, white_peg_colors, red_peg, white_peg)
      end

      next_guess = comp.computer_next_guess(almost_done, color_list)
      puts "\nComputer guess:"
      puts computer_guess
      puts ""
      puts "Guess feedback:"
      puts guess_feedback
      puts ""
      puts "Your Code:"
      puts player_code
      puts " "
      puts "Press Enter"
      gets

    end
    play_game = false
  end
  again_maybe = game.who_won?(player_win, computer_secret_code, player_choice)
  play_game = game.play_again?(again_maybe)
end


