require_relative 'lib/hangman.rb'
require_relative 'lib/word.rb'

hangman = Hangman.new
word_to_guess = Word.new('word')

secret_word = word_to_guess.secret_word
letters = word_to_guess.blank_spaces(secret_word)
hangman_call = hangman.hangman_array

puts hangman_call[6]
puts ""
puts secret_word
puts letters.join(" ")
puts ""