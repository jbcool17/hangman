require_relative 'word_list'
require_relative 'the_man'
module Game
	class Hangman
		attr_accessor :word, :points, :lives, :correct_guesses, :man
		
		def initialize
			@word = Game::WordList.new.word
			@letters = @word.split(//)
			@guessed_letters = []
			@correct_guesses = Array.new(@letters.count).map{|i| '_'}
			@lives = 7
			@points = 0
			@man = Game::TheMan.new.man
		end

		def check_for_letter(letter)
			# Checking Guessed letters
			if ( !@guessed_letters.index(letter).nil? )
				puts "You already guessed that letter or it is invalid!"

				# Subtracts a life & checks
				@lives -= 1
				check_for_loser
			else
				# Checking if letter is in word
				if ( @letters.index(letter).nil? )
					@guessed_letters << letter
					@lives -= 1
					check_for_loser
				else
					adds_correct_letter(letter)
					@guessed_letters << letter
					check_for_winner
				end
			end

			if ( @lives >= 0 )
				output_status
			end
		end

		def adds_correct_letter(letter)
			@word.length.times do |i|
				if (@word[i] == letter)
					@correct_guesses[i] = letter
					@points += 1
				end
			end
		end

		def check_for_winner
			@points == @word.length
		end

		def check_for_loser
			@lives <= 0
		end

		def output_status
			system "clear"
			puts "----------------------------------------------------------------------------------"	
			puts "STATUS:=> GUESS LETTERS: #{@guessed_letters.join(",")}"
			puts "STATUS:=> CORRECT GUESSES: #{@correct_guesses.join " "}"
			puts "STATUS:=> Points: #{@points} | Lives Left: #{@lives}"
			puts "The Word: #{@word}" # Remove this soon
			nums = [7,6,5,4,3,2,1,0]
			puts "----------------------------HANGMAN-----------------------------------------------"
				nums[@lives].times do |i|
					puts @man[i]
				end
			puts "----------------------------------------------------------------------------------"
		end
	end
end
