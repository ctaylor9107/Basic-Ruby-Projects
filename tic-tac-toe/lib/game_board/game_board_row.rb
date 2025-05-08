class GameBoardRow
  def initialize(row)
    @row = row
  end

  def row_value
    if @row == "top" || @row == "middle"
      @row_value = ["_","_","_"].join("|")
    elsif @row == "bottom"
      @row_value = [" "," "," "].join("|")
    end
  end
end