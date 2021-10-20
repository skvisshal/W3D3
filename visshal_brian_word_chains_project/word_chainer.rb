class WordChainer

    def initialize(dictionary_file_name)
        file = File.open(dictionary_file_name)
        file_data = file.readlines.map(&:chomp)
        file.close
        @dictionary = file_data
        @current_words = []
        @all_seen_words = []
    end

    def adjacent_words(word)
        alphabets = ('a'..'z').to_a
        legal_words = []
        (0...word.length).each do |i|
            alphabets.each do |char|
                word_check = word[0...i] + char + word[i+1..-1]
                legal_words << word_check if @dictionary.include?(word_check)
            end
        end
        legal_words
    end

    def run(source, target)
        while(!@current_words.empty?)

        end
    end

end