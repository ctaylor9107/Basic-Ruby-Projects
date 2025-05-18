class Word
  
  def initialize(word)
    @word = word
  end

  def secret_word
    word_choice = File.readlines('/home/ctaylor91/repos/Basic-Ruby-Projects/hangman/words.txt').select { |word| word.chomp.length >= 5 && word.chomp.length <= 12}
    length = word_choice.length
    secret_word = word_choice[rand(length)]
    return secret_word.chomp
  end

  def blank_spaces(secret_word)
    letters = secret_word.split("")
    spaces = []
    letters.each do |letter|
      spaces.push('_')
    end
    return spaces
  end

end