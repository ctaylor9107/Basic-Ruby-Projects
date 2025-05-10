require_relative 'lib/game_board/game_board.rb'
require_relative 'lib/players'



# object instances

board = GameBoard.new
player1 = Player.new("Player 1", "x")
player2 = Player.new("Player 2", "o")



# first display of tic-tac-toe grid

puts " "
puts board.game_board



# game loop

i = player1
 until board.cat_wins? == true
  output = board.update_board(i.value, i.player_row(board.game_board, i.player), i.player_column(board.game_board, i.player))
    if output == "dumb"
      i == i
    elsif board.player_winner?("x")
      break
    elsif board.player_winner?("o")
      break
    elsif i == player1
      i = player2
    elsif i == player2
      i = player1
    end
 end

puts "\nGame Over"

if board.player_winner?("x") == true
  puts "\nPlayer 1 is the winner!\n"
elsif board.player_winner?("o") == true
  puts "\nPlayer 2 is the winner!\n"
elsif board.cat_wins? == true
  puts "\nSorry, Cat wins. Try again?"
end







