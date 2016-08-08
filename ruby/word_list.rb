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
			word_list = ['one', 'two', 'three', 'four']
			number = rand(0..word_list.count-1)

			return word_list[number]
		end
	end

end
