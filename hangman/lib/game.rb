class Game
  

  def initialize
  end


  def update_blanks(guess, letters, blank_spaces)
    index_array = []
    letters.each_with_index do | letter, index |
      if letter == guess
        index_array.push(index)
      end
    end
    blank_spaces.each_with_index do | blank, index | 
      if index_array.include?(index)
        blank_spaces[index] = guess
      end      
    end 
    return blank_spaces
  end

  def already_guessed?(wrong_guesses, guess)
    if wrong_guesses.include?(guess) == false
      return false
    elsif wrong_guesses.include?(guess) == true
      return true
    end
  end
  
  def wrong_guesses(wrong_guesses, guess)
    wrong_guesses.push(guess)
  end


  def update_hangman_state(hangman, wrong_guesses)
    hangman[wrong_guesses.length]
  end

  def player_won?(blank_spaces, wrong_guesses)
    if blank_spaces.include?("_") == false
      return true
    elsif wrong_guesses.length == 6
      return false
    end
  end

  def save_game?(input)
    if input.downcase == "y" or input.downcase == "yes"
      return true
    elsif input.downcase == "n" or input.downcase == "no"
      return false
    else
      puts "\nPlease enter Y or N."
      save_game?(gets.chomp)
    end
  end

end