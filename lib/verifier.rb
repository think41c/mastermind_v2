require_relative './user_messages'

class Verifier

	attr_reader :possible_colors, :messages

	def initialize
		@messages = UserMessages.new
	end

	def verify_input(converted_input)
		right_number_chars?(converted_input)
		right_colors?(converted_input)
	end

	def right_number_chars?(input)                                     
		input.size == 4 ? true : (puts @messages.wrong_characters)
	end

	def right_colors?(input)
		possible_colors = %w[r g y b]
		right_colors = input.all? {|x| possible_colors.include? x}
		if right_colors == false then puts @messages.wrong_color end
		right_colors
		# input 
	end
end

if __FILE__ == $0

	v = Verifier.new
	print v.right_number_chars?(["z", "t", "r","g","b"])

end