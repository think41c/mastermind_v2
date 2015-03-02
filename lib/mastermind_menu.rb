require_relative './user_messages' #this is the master_messages
require_relative './playing_interface'

class MastermindMenu

	def initialize 
		@messages = UserMessages.new
	end

	def get_input 
		@input = gets.chomp.downcase
		returned_input = @input
	end

	def menu
		@play = PlayingInterface.new
		puts  @messages.welcome
		puts  @messages.options
		print @messages.prompt
		get_input

		case @input 
			when 'i'
				puts @messages.instructions
			when 'q' 
				quit
			when 'p' 
				@play.starting_guess
			else 
				invalid 
		end
		menu 
	end

	def quit 
		puts @messages.goodbye
		exit 
	end

	def invalid 
		puts @messages.invalid		
		menu
	end
end

if __FILE__ == $0

menu = MastermindMenu.new
menu.menu

end