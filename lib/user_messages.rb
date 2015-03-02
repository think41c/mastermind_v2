class UserMessages

	def opening_instructions
		"There is a sequence of 4 colors - R, G, Y, B.\n
I will tell you how many colors you have in the right position, and how many colors are in the wrong position.\n
You can also type 'c' to cheat, or 'q' to quit. 
You're being timed. Go ahead and make your best guess:\n"
	end

	def welcome 
		"M * A * S * T * E * R * M * I * N * D!\n".center(50)
	end

	def prompt 
		"\nPlease enter your response => "
	end

	def game_exit
		"Exiting out of the game to the main menu.\n"
	end

	def instructions
		"\nMastermind is a code-breaking game that helps develop deductive reasoning and logic by requiring players
to deduce secret combinations of colors with minimal clues. After each of these chances, the creator of the
code must reveal how many pegs are the correct color in the correct location, or the correct color in the 
incorrect location, or completely incorrect. With this little information, the code breaker must improve 
upon his previous guess to crack the code. Most Mastermind boards give players eight or 10 chances to correctly 
guess the code before requiring a forfeit.\n\n"
	end
	
	def goodbye
		"\nThanks for playing!\n"
	end

	def invalid
		"You're not typing a valid response."
	end

	def options
		"Press a key to (p)lay, (q)uit, or get (i)nstructions:\n"
	end

	def clearing
		system "clear"
	end

	def winner 
		"You're a winner!!! Back to the Main Menu.\n\n"
	end

	def wrong_color
		"You typed a character that isn't one of the possible colors.\n"
	end

	def round_quit
		"Bailing out of the round? Press enter to return to the main menu.\n"
	end

	def wrong_characters
		"You need to type in 4 characters to make a good guess.\n"
	end

	def loser(sequence)
		"You ran out of guesses. The correct sequence was ==> #{sequence.join.upcase} <==\n Better luck next time. Back to main menu.\n"
	end


	def guess_stat(guesses)
		"Nice guess, but not quite! That was guess ##{guesses}. 
		\nYou have #{10-guesses} remaining. Guess again or type 'q' to quit."
	end
	
	def timer_start_note
		"The timer has started. Guess as fast as you can!\n"
	end

	def evaluated_guess_response(right_position, right_color)
		"Number of spots that have color right AND position right  : #{right_position}
Number of spots that have color right BUT position wrong  : #{right_color}\n"  # This removes double counting right positions
	end

	def timer_result(minutes, seconds)
		"This round took you #{minutes} minutes and #{seconds} seconds.\n"
	end

end
