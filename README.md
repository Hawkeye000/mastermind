Mastermind
==========

**Requires 'Colorize' Gem**
Install with ```$ gem install colorize```

Or run ```bundle install``` to install colorize and the required RSpec version for testing.  

Running
-------
This file plays the codebreaker game "Mastermind"

Play by running "bin/mastermind.rb" through the ruby interpreter.  You will type a 'code' of colors and watch the code be printed with appropriate feedback of how close you are to breaking it.  The codes are entered by typing the full word.  Example: "red white magenta yellow"

You will see a black peg for each color in a correct spot.
You will see a white peg for each color not in a correct spot, but present in the code.

Try to get all black pegs before 12 turns are up, or edit the 'TURNS' constant to make it even harder!

You can challenge the computer to guess your code by running "bin/mastermind_challenge_ai.rb".  The computer is clever and uses a method very similar to Knuth's algorithm.

AI Algorithm Explanation
------------------------

The AI algorithm is similar to the one developed by Donald Knuth which solves the game in approximately 4.340 turns, however, unlike Knuth's algorithm, it does not rank subsequent guesses to maximize its chance of getting the code right.  Instead it just selects from the remaining possible codes randomly.  

It takes the following steps:
1. Guess a code with 'AABB' format (does allow 'AAAA' format too). Code is selected randomly.
2. Remove any code from the set of all codes that yield the same feedback as the last guess against the code to guess, but using the last guess as the code to compare to.
3. Make a random guess from the remaining set.
4. Repeat until it wins.

As this game is an excercise in illustrating software engineering, OOP, and project organization rather than computer science, the code is not optimized for minimal number of guesses.

See [Mastermind Algorithm] (http://en.wikipedia.org/wiki/Mastermind_%28board_game%29#Five-guess_algorithm) on Wikipedia for more info.  
