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
end