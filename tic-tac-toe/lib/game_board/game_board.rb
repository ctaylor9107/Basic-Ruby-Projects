require_relative 'game_board_row'

class GameBoard
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

  def display
    @game_board.each { |value| puts value }
  end
end