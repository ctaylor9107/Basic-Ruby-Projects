require_relative 'lib/hangman.rb'
require_relative 'lib/word.rb'
require_relative 'lib/player.rb'
require_relative 'lib/game.rb'



hangman = Hangman.new
word_to_guess = Word.new('word')
player1 = Player.new('player')
game = Game.new



secret_word = word_to_guess.secret_word
letters = word_to_guess.letters(secret_word)
blank_spaces = word_to_guess.blank_spaces(letters)
wrong_guesses = []
hangman_call = hangman.hangman_array
current_state = hangman_call[0]


puts current_state
puts ""
puts secret_word
puts letters.join(" ")
puts blank_spaces.join(" ")
puts ""

i = 0
until i == 6
  guess = player1.player_guess(gets.chomp)
  puts "Your guess: #{guess}"
  if player1.player_guess_correct?(guess, secret_word) == true
    blank_spaces = game.update_blanks(guess, letters, blank_spaces)
    puts current_state
    puts ""
    puts blank_spaces.join(" ")
    puts ""
    puts "Wrong guesses #{wrong_guesses.join(", ")}"
    if blank_spaces.include?("_") == false
      break
    end
  elsif player1.player_guess_correct?(guess, secret_word) == false && game.already_guessed?(wrong_guesses, guess) == false
    wrong_guesses = game.wrong_guesses(wrong_guesses, guess)
    puts current_state = game.update_hangman_state(hangman_call, wrong_guesses)
    puts ""
    puts blank_spaces.join(" ")
    puts ""
    puts "Wrong guesses: #{wrong_guesses.join(", ")}"
    i += 1
  elsif player1.player_guess_correct?(guess, secret_word) == false && game.already_guessed?(wrong_guesses, guess) == true
    puts "\nYou already guessed that letter, try again."
  end
end
puts ""
puts "Game Over"




  # puts current_state
  # puts ""
  # puts secret_word
  # puts letters.join(" ")
  # puts blank_spaces.join(" ")
  # puts ""
  # puts guess = player1.player_guess(gets.chomp)
  # puts player1.player_guess_correct?(guess, secret_word)
  # puts game.update_blanks(guess, letters, blank_spaces).join(" ")
  # puts "Wrong guesses: #{game.wrong_guesses(wrong_guesses, guess)}"
  # puts game.update_hangman_state(hangman_call, wrong_guesses)
