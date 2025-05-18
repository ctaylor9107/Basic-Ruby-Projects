require_relative 'lib/hangman.rb'
require_relative 'lib/word.rb'
require_relative 'lib/player.rb'

hangman = Hangman.new
word_to_guess = Word.new('word')
player1 = Player.new('player')

secret_word = word_to_guess.secret_word
letters = word_to_guess.blank_spaces(secret_word)
hangman_call = hangman.hangman_array

puts hangman_call[6]
puts ""
puts secret_word
puts letters.join(" ")
puts ""
puts guess = player1.player_guess(gets.chomp)
puts player1.player_guess_correct?(guess, secret_word)