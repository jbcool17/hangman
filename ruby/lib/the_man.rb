module Game
	class TheMan
		def initialize
			@man = build_the_man
		end

		def man
			@man
		end

		private

		def build_the_man
			man = ['|----0', 
				   '|  \ | /', 
				   '|   \|/', 
				   '|    |', 
				   '|   / \\', 
				   '|  /   \\', 
				   '|_________']

			return man
		end
	end
end