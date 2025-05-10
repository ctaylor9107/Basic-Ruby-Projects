require_relative 'lib/game_board/game_board.rb'
require_relative 'lib/players'



# object instances

board = GameBoard.new
player1 = Player.new("Player 1", "x")
player2 = Player.new("Player 2", "o")



# first display of tic-tac-toe grid

puts board.game_board



# game loop

i = player1
until (board.game_board[0].include?("_") == false)  && (board.game_board[1].include?("_") == false)  && (board.game_board[2].include?(" ") == false)
  output = board.update_board(i.value, i.player_row(board.game_board), i.player_column(board.game_board))
    if output == "dumb"
      i == i
    elsif i == player1
      i = player2
    elsif i == player2
      i = player1
    end
end







