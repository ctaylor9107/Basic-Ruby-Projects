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
hangman_call = hangman.hangman_array
current_statue = hangman_call[0]

puts current_statue
puts ""
puts secret_word
puts letters.join(" ")
puts blank_spaces.join(" ")
puts ""
puts guess = player1.player_guess(gets.chomp)
puts player1.player_guess_correct?(guess, secret_word)
puts game.update_blanks(guess, letters, blank_spaces).join(" ")