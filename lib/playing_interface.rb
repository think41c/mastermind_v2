require_relative './user_messages' #this is the master_messages
require_relative './mastermind_menu'
require_relative './mastermind_timer'
require_relative './logic'
require_relative './verifier'
require_relative './files'

class PlayingInterface
	
	def initialize 
		@messages       = UserMessages.new
		@timer          = MastermindTimer.new
		@logic          = Logic.new
		@verifier       = Verifier.new
		@menu           = MastermindMenu.new
		@files          = Files.new
		@compy_sequence = @logic.random_sequence
		@guesses        = 0 
	end

	def guess_status        # Will make you lose if you hit 10 guesses. Checks the current number of guesses. 
		@guesses += 1
		if @guesses > 9 then lose end
		puts @messages.guess_stat(@guesses)
		puts @messages.evaluated_guess_response(@logic.right_position, @logic.right_color)
	end

	def input_converter
		user_input = gets.chomp.downcase
		@converted_input = user_input.chars
	end

	def starting_guess
		@messages.clearing		                      # Clear screen
		puts @messages.opening_instructions           # Show instructions
		@timer.timer_start                            # Start timer
		guess
	end

	def guess
		print @messages.prompt
		input_converter                               # Get and convert the users guess 
		quit(@converted_input) 						  # Does the user want to quit? 
		cheat(@converted_input)						  # Does the user want to cheat? 
		@verifier.verify_input(@converted_input)      # Evaluate input is a valid guess. 
		@logic.evaluate_guess(@converted_input)       # Evaluate the valid guess. 
		if @logic.right_position == 4 
			win
		else
			guess_status
			guess
		end
	end

	def win
		puts @messages.winner
		@timer.timer_finish                   # Stop timer
		@timer.print_the_total_time           # Display full timed results
		record_score_to_file
		@menu.menu
	end

	def record_score_to_file 
		seconds = @timer.seconds
		minutes = @timer.minutes
		@files.save_high_scores("high_scores.txt", seconds, minutes)
	end

	def lose
		puts @messages.loser(@compy_sequence)
		@timer.timer_finish                   # Stop timer
		@timer.print_the_total_time           # Display full timed results
		@menu.menu
	end

	def quit(input)
		if input[0] == "q"
			puts @messages.round_quit
			gets.chomp
			@messages.clearing
			@menu.menu 
		end
	end

	def cheat(input)
		if input[0] == "c"
			puts @compy_sequence.join.center(60).upcase
		end
	end
end

if __FILE__ == $0
interface = PlayingInterface.new

8.times do |x|
	interface.guess_status
end
end


