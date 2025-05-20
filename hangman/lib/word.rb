class Word
  
  def initialize(word)
    @word = word
  end

  def secret_word
    word_choice = File.readlines('./words.txt').select { |word| word.chomp.length >= 5 && word.chomp.length <= 12}
    length = word_choice.length
    secret_word = word_choice[rand(length)]
    return secret_word.chomp
  end

  def letters(secret_word)
    secret_word.split("")
  end

  def blank_spaces(letters)
    spaces = []
    letters.each do |letter|
      spaces.push('_')
    end
    return spaces
  end

end