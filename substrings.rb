def substrings(word_or_phrase, substring_dictionary)

  p the_string = word_or_phrase.downcase
  dictionary_array = substring_dictionary

  output_hash = Hash.new

  dictionary_array.each do |substring|
    if the_string.include?(substring)
      substring_match = the_string.gsub(substring, "1")
      substring_amount = substring_match.count("1")
      output_hash[substring] = substring_amount
    end
  end
output_hash
end