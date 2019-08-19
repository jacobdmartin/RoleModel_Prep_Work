class String
  def title_case
    split_sentence = self.split()
    split_sentence.each() do |word|
      word.upcase()
    end
    split_sentence.join(" ")
  end
end
