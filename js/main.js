console.log('HANGMAN')

// The Hangman Game:

// *The game selects a random word from a word list and makes that the secret word
// *The player guesses one letter at a time, trying to figure out what the word is
// *If the player guesses correctly, any instances of that letter are revealed in the secret word
// *If the player guesses incorrectly, they are penalized by taking away a guess
// *If a player reveals all of the letters of the secret word, they win
// *If a player makes 8 incorrect guesses before solving the secret word, they lose
// To do:

// Plan out your object model. What variables and functions will each object have? How will the different objects communicate with each other?
// Get the logic to work and make sure you have the game working in the console first before translating it over to update the DOM.
// Translate your game over so it updates the DOM.
// Once you get the game working:
// Implement a "reset" button that will reset the game and choose a new word
// Implement a "give up" button that will show the solution
// Are there ways to refactor your code to make it DRYer?


//Getting word from 'words.js' list
rand = Math.floor((Math.random() * words.length) + 1);
theWord = words[rand];
letters = theWord.split('')

var Hangman = {
	checkForLetter: function (letter) {

		// Check if input is invalid
		if ( this.guessedLetters.indexOf(letter) >= 0 || letter.length > 1 ) {

			console.log('You already guessed that letter or it is invalid, yo!');
			//this.guessedLetters.push(letter);
			this.lives--;
			this.checkForLoser();

		} else {

			// is letter is not correct
			if (letters.indexOf(letter) === -1) {

				this.guessedLetters.push(letter);
				this.lives--;
				this.checkForLoser();

			} else {

				// if word has multiple letters
				if ( theWord.split(letter).length - 1 > 0 ) {
					
					//insert letter
					_.each(theWord.split(letter), function() { 
							Hangman.addsCorrectLetter(letter);
						    Hangman.points++;
						});

					// for ( var i = 0; i < theWord.split(letter).length - 1; i++ ) {
							
					// 	this.addsCorrectLetter(letter);
					// 	this.points++;

					// }
					
					//add to guessed
					this.guessedLetters.push(letter);

				} else {
					//add to guessed
					this.guessedLetters.push(letter);
					//insert
					this.addsCorrectLetter(letter);
					//add point
					this.points++;		

				}

				//checks for winner
				this.checkForWinner();

			}
			
		}

		console.log(theWord, 'GUESSED LETTERS:',this.guessedLetters, 'CORRECT GUESSES:', this.correctGuesses);
	
	},

	addsCorrectLetter: function (letter) {

		for (var i = 0; i < theWord.length; i++ ) {

			if ( theWord[i] === letter ) {
				this.correctGuesses[i] = letter;
			}
		}
		
	},

	checkForWinner: function () {

		if ( this.points === theWord.length	) {
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

	setWord: function (theWord) {

		_.each(theWord, function(){ Hangman.correctGuesses.push('_')} );

		$('#word').text(this.correctGuesses.join(' '));

	},

	guessedLetters: [],
	correctGuesses: [],
	lives: 8,
	points: 0,

	updateDislay: function () {
		var currentLetter = $('#letter').val();
		this.checkForLetter(currentLetter);

		$('#guessed').text('Guessed Letters: ' + this.guessedLetters.join(', '));
		$('#word').text(this.correctGuesses.join(' '));
		$('#lives').text(this.lives);
		$('#points').text('POINTS: ' + this.points);
		$('#letter').val('');
	}

}

$(document).ready(function () {
	// $.getJSON("js/words.json", function (json) {
	//     console.log(json);
	// });

	$('#lives').text('LIVES LEFT: ' + Hangman.lives);
	$('#points').text('POINTS: ' + Hangman.points);
	Hangman.setWord(theWord);
	
	//Click SUBMIT
	$('#submit').on('click', function () {
		Hangman.updateDislay();
	});

	//ENTER
	$(this).keypress(function (e) {

		if(e.which == 13) {
			Hangman.updateDislay();
    	}	
			

		
	});

});








