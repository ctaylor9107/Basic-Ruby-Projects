class Player
  attr_reader :value, :player

  def initialize(player, value)
    @player = player
    @value = value
  end

  def player_row(view_gameboard_method, current_player)
    puts "\n#{current_player}, input row: Top, Middle, or Bottom\n"
    row_choice = gets.chomp
  
    if row_choice.downcase == "top"
      0
    elsif row_choice.downcase == "middle"
      1
    elsif row_choice.downcase == "bottom"
      2
    else
      puts "\nInvalid input,#{current_player}try again\n"
      puts view_gameboard_method
      player_row(view_gameboard_method)
    end
  end

  def player_column(view_gameboard_method, current_player)
    puts "\n#{current_player}, input column: Left, Middle, or Right\n"
    column_choice = gets.chomp
  
    if column_choice.downcase == "left"
      0
    elsif column_choice.downcase == "middle"
      2
    elsif column_choice.downcase == "right"
      4
    else
      puts "\nInvalid input,#{current_player} try again\n"
      puts view_gameboard_method
      player_column(view_gameboard_method)
    end
  end
end