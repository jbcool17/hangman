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

game_two = Game::Hangman.new

puts "Auto Running Game..."
puts "--------------------"
game_two.check_for_letter 'a'
game_two.check_for_letter 'b'
game_two.check_for_letter 'c'
game_two.check_for_letter 'o'
game_two.check_for_letter 'a'
game_two.check_for_letter 'n'
# game_two.check_for_letter 'e'
game_two.check_for_letter 'z'
game_two.check_for_letter 'j'
game_two.check_for_letter 'b'
game_two.check_for_letter 'k'

puts "--------------------"
puts "-------DONE!--------"
puts "--------------------"