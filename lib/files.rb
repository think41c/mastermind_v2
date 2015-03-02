require_relative 'playing_interface'
require_relative 'mastermind_timer'
class Files

	def save_high_scores(score_file="high_scores.txt", seconds, minutes)
		player = PlayingInterface.new
  		File.open(score_file, "a+") do |file|
  		file.puts "Scores:\n#{minutes} minutes #{seconds} seconds."
	    end
	end
end
