LETTERS = %w[a i n r d l h].freeze

def match_words?(word)
  return false if word.size <= 3 || !word.include?('l')
  word.chars.each do |letter|
    if !LETTERS.include?(letter)
      return false
    end
  end
  return true
end


File.open("/usr/share/dict/words") do |file|
  file.each do |line|
    if match_words?(line.strip)
      puts line
    end
  end
end
