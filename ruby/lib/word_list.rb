require 'json'

module Game
	class WordList
		def initialize
			@word = set_word
		end
		
		def word
			@word
		end

		private
		def set_word
			word_list = generate_word_list
			number = rand(0..word_list.count-1)

			return word_list[number]
		end

		def generate_word_list
			file = File.read('dictionary.json')

			data_hash = JSON.parse(file)

			return data_hash.collect {|k,v| k.downcase }
		end
	end

end
