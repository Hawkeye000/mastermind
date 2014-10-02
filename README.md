This file plays the codebreaker game "Mastermind"

Play by running "bin/mastermind.rb" through the ruby interpreter.  You will type a 'code' of colors and watch the code be printed with appropriate feedback of how close you are to breaking it.  The codes are entered by typing the full word.  Example: "red white magenta yellow"

You will see a black peg for each color in a correct spot.
You will see a white peg for each color not in a correct spot, but present in the code.

Try to get all black pegs before 12 turns are up, or edit the 'TURNS' constant to make it even harder!

You can challenge the computer to guess your code by running "bin/mastermind_challenge_ai.rb".  The computer is clever and uses a method very similar to Knuth's algorithm.