require_relative 'hangman'

game_one = Game::Hangman.new

puts "Auto Running Game..."
puts "--------------------"
game_one.check_for_letter 'a'
game_one.check_for_letter 'b'
game_one.check_for_letter 'c'
game_one.check_for_letter 'o'
game_one.check_for_letter 'a'
game_one.check_for_letter 'n'
game_one.check_for_letter 'e'

puts "--------------------"
puts "-------DONE!--------"
puts "--------------------"
puts "Starting Game Two"
puts "Enter..."

game_two = Game::Hangman.new
status = true
while status do
	print 'Make a guess: '
	input = gets.chomp[0]
	game_two.check_for_letter input
	
	if (game_two.check_for_winner || game_two.check_for_loser)
		status = false
	end	
end


puts 'ending'
