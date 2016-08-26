# require_relative '../start'
require 'hangman'

describe Game::Hangman do
	before(:each) do
		@game = Game::Hangman.new
	end
	context "tests the game" do
		it "gives a word" do
			expect(@game.word.class).to eq String
		end

		it "check correct guesses matches" do
			expect(@game.correct_guesses.count).to eq @game.word.length
		end

		it "inits a game" do
			expect(@game.class).to eq Game::Hangman
		end

		it "checks for points - 0" do
			expect(@game.points).to eq 0
		end

		it "checks for lives - 7" do
			expect(@game.lives).to eq 7
		end

		it "checks for man" do
			expect(@game.man.class).to eq Array
		end
	end
end