using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CSharpPractice
{
    class HangMan
    {
        public string word;
        private static List<string> wordList = new List<string>() { "hello", "world", "dogs", "cats", "fish" };
        public int score;
        public int guesses;
        public List<char> guessedLetters = new List<char>();
        public int wrongGuesses;
        public List<string> man = new List<string>();
        
        public string blankWord;
        
        //Initialize the game 
        public void init()
        {
            word = GetRandWord();
            blankWord = CreateBlankWord(word);
            score = 0;
            guesses = 9;

            TheMan theMan = new TheMan();
            theMan.buildMan();
            man = theMan.outPutMan();
           


            //Welcome Message
            Console.WriteLine("Welcome to HangMan!");
            Console.WriteLine("You have " + guesses + " guesses.");
            Console.WriteLine("Pick a letter!");
            Console.WriteLine("The Word: " + blankWord);
            Console.WriteLine("------------------------------------------");

        }
                
        public void GetWordsList()
        {
            foreach (string word in wordList)
            {
                Console.WriteLine(word);
            }
        }

        private string GetRandWord()
        {
            Random r = new Random();
            int number = r.Next(0, 4);
            word = wordList[number];

            return wordList[number];
        }

        private string CreateBlankWord(string word)
        {
            
            List<char> blankSpacePush = new List<char>();
            char blankSpace = '_';

            for (int i = 0; i < word.Length; i++)
            {
                blankSpacePush.Add(blankSpace);
            }

            return string.Join("", blankSpacePush.ToArray());
        }

        public void checkForLetter(string command)
        {
                        
            char[] guess = command.ToCharArray();
            
            //First check if already guessed
            if ( guessedLetters.IndexOf(guess[0]) >= 0 )
            {             
                wrongGuesses += 1;
                score -= 1;
                guessedLetters.Add(guess[0]);
                Console.WriteLine("You already guessed that!");
            }
            else
            {
                //Check if not in word else
                if ( word.ToList<char>().IndexOf(guess[0]) == -1)
                {
                    wrongGuesses += 1;
                    score -= 1;
                    guessedLetters.Add(guess[0]);
                    Console.WriteLine("Noped!");
                }
                else
                {
                    guessedLetters.Add(guess[0]);
                    addsCorrectLetter(guess[0]);
                }
                
            }
            
        }

        public bool checkForWinner()
        {
            var output = false;

            if ( blankWord == word)
            {
                output = true;
                
                Console.WriteLine("You won!");
            }

            return output;
        }

        private void addsCorrectLetter(char letter)
        {
            
            for (int i = 0; i < word.Length; i++)
            {
                if ( word[i] == letter )
                {
                    blankWord = blankWord.Remove(i, 1);
                    blankWord = blankWord.Insert(i, letter.ToString());
                    score += 1;
                    Console.WriteLine("LETTER FOUND!");
                }                   
               
            }

            
        }
                
    }
}
