using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System.Net;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CSharpPractice
{
    public class Program
    {

        static void Main(string[] args)
        {

            HangMan game = new HangMan();
            
            //Init Game
            game.init();
            string randomWord = game.word;
            string input;
            
            //Game Loop
            
            while (game.guesses > 0)
            {
                input = Console.ReadLine();
                Console.Clear();
                game.checkForLetter(input);

                //Check for Winner
                if (game.checkForWinner())
                {
                    game.guesses = 0;
                    Console.WriteLine("Winner");
                }
                else if (game.guesses == 0)
                {
                    Console.Clear();
                    Console.WriteLine("You lost man!");
                }
                else
                {
                    game.guesses -= 1;                    
                    Console.WriteLine("Nothing yet...keep going");                    
                }

                //Print Stats
                Console.WriteLine("Guessed Letters: " + string.Join(",", game.guessedLetters.ToArray()));
                Console.WriteLine("You have " + game.guesses + " guesses left.");
                Console.WriteLine("Score: " + game.score);
                Console.WriteLine("The Word: " + game.blankWord);
                Console.WriteLine("------------------------------------------");
                                
                //Print out man
                for (int i = 0; i < game.wrongGuesses; i++)
                {
                    Console.WriteLine(game.man[i]);
                }
                
            }

            Console.WriteLine("This Game has finished. Hope you had fun!");
            Console.ReadLine();
        }        
    }
}
