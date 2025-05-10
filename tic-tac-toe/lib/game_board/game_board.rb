require_relative 'game_board_row'

class GameBoard
  attr_reader :game_board

  def initialize
    top_row = GameBoardRow.new("top")
    middle_row = GameBoardRow.new("middle")
    bottom_row = GameBoardRow.new("bottom")

    @game_board = [
      top_row.row_value,
      middle_row.row_value,
      bottom_row.row_value
    ]
  end


  def update_board(player_value, row, column)
    
    if @game_board[row][column] == " " || @game_board[row][column] == "_"
      @game_board[row][column] = player_value
      puts @game_board
    else
      puts "Pick a different spot"
      puts @game_board
      return "dumb"
    end
  end


  def player_winner?(player_value)
    if (@game_board[0][0] == player_value) && (@game_board[0][2] == player_value) && (@game_board[0][4] == player_value)
      return true
    elsif (@game_board[1][0] == player_value) && (@game_board[1][2] == player_value) && (@game_board[1][4] == player_value)
      return true
    elsif (@game_board[2][0] == player_value) && (@game_board[2][2] == player_value) && (@game_board[2][4] == player_value)
      return true
    elsif (@game_board[0][0] == player_value) && (@game_board[1][0] == player_value) && (@game_board[2][0] == player_value)
      return true
    elsif (@game_board[0][2] == player_value) && (@game_board[1][2] == player_value) && (@game_board[2][2] == player_value)
      return true
    elsif (@game_board[0][4] == player_value) && (@game_board[1][4] == player_value) && (@game_board[2][4] == player_value)
      return true
    elsif (@game_board[0][0] == player_value) && (@game_board[1][2] == player_value) && (@game_board[2][4] == player_value)
      return true
    elsif (@game_board[2][0] == player_value) && (@game_board[1][2] == player_value) && (@game_board[0][4] == player_value)
      return true
    else
      return false
    end
  end

  def cat_wins?
    if (@game_board[0].include?("_") == false)  && (@game_board[1].include?("_") == false)  && (@game_board[2].include?(" ") == false)
      return true
    else
      return false
    end
  end
end