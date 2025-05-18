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

end