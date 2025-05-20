require 'yaml'

class GameState
  attr_reader :hangman_state, :secret_word, :blank_spaces, :wrong_guesses
  def initialize(hangman_state, secret_word, blank_spaces, wrong_guesses)
    @hangman_state = hangman_state
    @secret_word = secret_word
    @blank_spaces = blank_spaces
    @wrong_guesses = wrong_guesses
  end

  def to_yaml
    YAML.dump ({
      :hangman_state => @hangman_state,
      :secret_word => @secret_word,
      :blank_spaces => @blank_spaces,
      :wrong_guesses => @wrong_guesses
    })
  end

  def self.from_yaml(save_file)
    data = YAML.load save_file
    self.new(data[:hangman_state], data[:secret_word], data[:blank_spaces], data[:wrong_guesses])
  end
end