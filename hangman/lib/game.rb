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

end