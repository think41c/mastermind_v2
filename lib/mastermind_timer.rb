require_relative 'user_messages' #this is the master_messages

class MastermindTimer

	attr_reader   :minutes, :seconds
	attr_accessor :total_time 

	def initialize 
		@messages = UserMessages.new
		@minutes  = minutes
		@seconds  = seconds
	end

	def timer_start
		@start_time = Time.now
	end

	def timer_finish
		@finish_time = Time.now
	end

	def calculate_time(finish, start)
		total_time  = finish - start
		@minutes    = total_time.to_i / 60
		@seconds    = total_time.to_i % 60
	end

	def print_the_total_time
		calculate_time(@finish_time, @start_time)
		puts @messages.timer_result(@minutes, @seconds)
	end
end
