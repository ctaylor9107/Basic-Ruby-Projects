class Player
  

  def initialize(player)
    @player = player    
  end

  def player_guess(letter_guess)
    alphabet = ('a'..'z')
    if alphabet.include?(letter_guess.downcase)
      return letter_guess
    else
      puts "Sorry, that is an incorrect guess. Please try again."
      player_guess(gets.chomp)
    end
  end


  def player_guess_correct?(letter_guess, secret_word)
    if secret_word.include?(letter_guess) == true
      return true
    elsif secret_word.include?(letter_guess) == false
      return false      
    end
  end

end