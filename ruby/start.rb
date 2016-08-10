require_relative './lib/hangman'

puts "-------------------"
puts "Welcome To Hangman!"
puts "-------------------"

game = Game::Hangman.new
status = true
while status do
	print 'Make a guess: '
	input = gets.chomp[0]
	game.check_for_letter input
	
	if (game.check_for_winner || game.check_for_loser)
		status = false
	end	
end

if (game.check_for_winner)
	puts "You Won!"
else
	puts "You Lose!"
end

puts 'The Game Has Ended.'
