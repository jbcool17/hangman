module Game
	class Hangman
		
		def initialize
			word_list = ['one', 'two', 'three', 'four']
			@word = 'one' # get random word
			@letters = @word.split(//)
			@guessed_letters = []
			@correct_guesses = Array.new(@letters.count)
			@lives = 8
			@points = 0
		end

		def check_for_letter(letter)
			# Already Guessed
			if ( @guessed_letters.index(letter) != nil )
				puts "You already guessed that letter or it is invalid!"
				@lives -= 1
				check_for_loser
			else
				# Letters not in word
				if (@letters.index(letter).nil?)
					# add to guessed letter array
					@guessed_letters << letter
					# subract a life
					@lives -= 1
					# check_for_loser
					check_for_loser
				else
					# check out this - d?
					# could also use chars
					length = @word.split(//).select { |l| l == 'd' }.count
					if (length > 1)
						# Loop
						length.times do 
							adds_correct_letter(letter)
							@points += 1
						end
							
						# add letter to guessed_letters
						@guessed_letters << letter

					else
						# add to guessLetters
						@guessed_letters << letter
						# addsCorrectLetter
						adds_correct_letter (letter)
						# add point
						@points += 1
					end

					# check_for_winner
					check_for_winner
				end

			end

			puts "STATUS:=> GUESS LETTERS: #{@guessed_letters}| CORRECT GUESSES: #{@correct_guesses}"
			puts "STATUS:=> Points: #{@points} | Lives Left: #{@lives}"
			puts "----------------------------------------------------------------------------------"
		end

		def adds_correct_letter(letter)
			@word.length.times do |i|
				if (@word[i] == letter)
					@correct_guesses[i] = letter
				end
			end

			puts "STATUS: #{@correct_guesses.join('')}"
		end

		def check_for_winner
			if ( @points == @word.length )
				puts 'You Win!'
				puts "WORD: #{@word}"
			end
		end

		def check_for_loser
			if @lives == 0 then puts "You Lose!" end
		end

		def output_status(message)
			puts "STATUS: #{message}"
		end


	end
end
