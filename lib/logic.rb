class Logic    # Generate the Sequence, Evalutes Position & Color, Evaluates Color

	attr_reader :right_position, :right_color

	def random_sequence  # Make a random sequence of letters using b y g r only.
		@possible_colors = (%w[b y g r])
		@sequence_gen    = (@possible_colors*4).shuffle.sample(4)
	end
	
	def calculate_right_color(input, sequence, right_pos)  # Calculate right color, wrong position. 
		# Create an array w/ count of occurances of each color in the computer sequence for all possible colors. 
		compy_colors   = @possible_colors.map {|color| sequence.count{|secret_color| secret_color == color}}  
		
		# Create an array w/ count of occurances of each color in the users sequence for all possible colors. 
		guess_colors   = @possible_colors.map {|color| input.count   {|guess_color|  guess_color  == color}}

		# Create an array that zips/combines both the compy_colors and the guess_colors into a 2D array. 
		correct_colors = compy_colors.zip(guess_colors)

		# Create an array that reduces the array to the sum of the minimums of each element in the array. 
		# .reduce takes arg (0), otherwise the sum of correct color would start (unintentionally) as the first value in the array. 
		correct_colors = correct_colors.reduce(0) {|sum, values| sum + values.min}
		correct_colors = correct_colors - right_pos
	end

	def calculate_right_position(input, sequence)   # Calculates right color, right position.
		@right_position = 0                        
		input.each_with_index do |color, position|            
			if color == sequence[position]
				@right_position += 1
			end
		end
		@right_position
	end

	def evaluate_guess(input)                              
		@right_position      = calculate_right_position(input, @sequence_gen)
		@right_color         = calculate_right_color(input, @sequence_gen, @right_position)   
	end
end