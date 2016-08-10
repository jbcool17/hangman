require_relative 'word_list'
require_relative 'the_man'
module Game
	class Hangman
		
		def initialize
			@word = Game::WordList.new.word
			@letters = @word.split(//)
			@guessed_letters = []
			@correct_guesses = Array.new(@letters.count)
			@lives = 8
			@points = 0
			@man = Game::TheMan.new
		end

		def check_for_letter(letter)
			# Already Guessed
			if( @lives <= 0 )
				puts 'You already lost mate. Stop trying.'
			elsif ( @guessed_letters.index(letter) != nil )
				puts "You already guessed that letter or it is invalid!"
				@lives -= 1
				check_for_loser
			else
				# Letters not in word
				if ( @letters.index(letter).nil? )
					# add to guessed letter array
					@guessed_letters << letter
					# subract a life
					@lives -= 1
					# check_for_loser
					check_for_loser
				else
					# check out this - d?
					# could also use chars
					length = @word.split(//).select { |l| l == letter }.count
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

			if (@lives >= 0)
				output_status
			end
		end

		def adds_correct_letter(letter)
			@word.length.times do |i|
				if (@word[i] == letter)
					@correct_guesses[i] = letter
				end
			end
		end

		def check_for_winner
			# if @points == @word.length then	puts 'You Win!' end
			return @points == @word.length
		end

		def check_for_loser
			# if @lives <= 0 then puts "You Lose!" end
			return @lives <= 0
		end

		def output_status
			puts "STATUS:=> GUESS LETTERS: #{@guessed_letters.join(",")}| CORRECT GUESSES: #{@correct_guesses}"
			puts "STATUS:=> Points: #{@points} | Lives Left: #{@lives}"
			puts "----------------------------------------------------------------------------------"
				@lives.times do |i|
					puts @man.man[i]
				end
			puts "----------------------------------------------------------------------------------"
		end
	end
end
