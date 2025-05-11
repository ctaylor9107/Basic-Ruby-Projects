class Player
  
  def initialize(player)
    @player = player
  end

  def player_turn(color_list)
    puts "Make a choice from the below colors"
    puts "\n1. #{color_list[0]}"
    puts "2. #{color_list[1]}"
    puts "3. #{color_list[2]}"
    puts "4. #{color_list[3]}"
    puts "5. #{color_list[4]}"
    puts "6. #{color_list[5]}"
    player_code_guess(color_list)
  end

  def player_code_guess(color_list)
    puts "Choose from above: 1, 2, 3, 4, 5, or 6"
    puts " "
    create_player_choice(color_list)
  end

  def create_player_choice(color_list)
    player_code = []
    i = player_code.length
    while i < 4
      player_input = gets.to_i
      if player_input.between?(1, 6) == false
        puts "Invalid input, please try again"
      elsif player_input.between?(1, 6) == true
        output = "Your guess: #{player_code.push(color_list[player_input - 1]).join(", ")}"
        puts output
        i = player_code.length
      end
    end
    player_code
  end


end