console.log('HANGMAN')

// The Hangman Game:

// The game selects a random word from a word list and makes that the secret word
// The player guesses one letter at a time, trying to figure out what the word is
// If the player guesses correctly, any instances of that letter are revealed in the secret word
// If the player guesses incorrectly, they are penalized by taking away a guess
// If a player reveals all of the letters of the secret word, they win
// If a player makes 8 incorrect guesses before solving the secret word, they lose
// To do:

// Plan out your object model. What variables and functions will each object have? How will the different objects communicate with each other?
// Get the logic to work and make sure you have the game working in the console first before translating it over to update the DOM.
// Translate your game over so it updates the DOM.
// Once you get the game working:
// Implement a "reset" button that will reset the game and choose a new word
// Implement a "give up" button that will show the solution
// Are there ways to refactor your code to make it DRYer?

var Words = {

	1: 'onnne',
	2: 'two',
	3: 'three'

}


// for (word in Words) {
// 	console.log(Words[word])
// }


rand = Math.floor((Math.random() * words.length) + 1);
theWord = words[rand];
letters = theWord.split('')


var Hangman = {
	checkForLetter: function (letter) {

		if ( this.guessedLetters.indexOf(letter) >= 0 || letter.length > 1 ) {

			console.log('You already guessed that letter or it is longer, yo!');
			//this.guessedLetters.push(letter);
			this.lives--;
			this.checkForLoser();

		} else {

			if (letters.indexOf(letter) === -1) {

				this.guessedLetters.push(letter);
				this.lives--;
				this.checkForLoser();

			} else {

				if ( theWord.split(letter).length - 1 > 0 ) {

					for ( var i = 0; i < theWord.split(letter).length - 1; i++ ) {
						this.correctGuesses.push(letter);		
					}

					this.guessedLetters.push(letter);

				} else {

					this.guessedLetters.push(letter);
					this.correctGuesses.push(letter);		

				}
							
				this.checkForWinner();

			}
			
		}

		console.log('GUESSED LETTERS:',this.guessedLetters, 'CORRECT GUESSES:', this.correctGuesses);

		
		
	},

	checkForWinner: function () {

		if ( this.correctGuesses.length === theWord.length	) {
			console.log('You Win!');
			$('#message').text('YOU WIN!', theWord, 'is the answer!');
			$('#letter').hide();
			$('#submit').hide();
		}
		
	},

	checkForLoser: function () {
		if ( this.lives === 0 ) {
			console.log('You lose!');
			$('#message').text('YOU LOSE!', theWord, 'was the answer!');
			$('#letter').hide();
			$('#submit').hide();

		}

	},
	guessedLetters: [],
	correctGuesses:[],
	lives: 8


}


// $('body').text(Hangman.lives);

$(document).ready(function () {
	// $.getJSON("js/words.json", function (json) {
	//     console.log(json);
	// });

	
	$('#submit').on('click', function () {
		var currentLetter = $('#letter').val();
		Hangman.checkForLetter(currentLetter);

		$('#guessed').text('Guessed Letters: ' + Hangman.guessedLetters.join(', '));
		$('#correct').text('Correct Guesses: ' + Hangman.correctGuesses.join(', '));
		$('#lives').text(Hangman.lives);
		$('#letter').val('');
		
	});
	$(this).keypress(function (e) {

		if(e.which == 13) {
			var currentLetter = $('#letter').val();
			Hangman.checkForLetter(currentLetter);

			$('#guessed').text('Guessed Letters: ' + Hangman.guessedLetters.join(', '));
			$('#correct').text('Correct Guesses: ' + Hangman.correctGuesses.join(', '));
			$('#lives').text('LIVES LEFT: ' + Hangman.lives);
			$('#letter').val('');

    	}	
			

		
	});

});








