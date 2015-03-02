require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require_relative '../lib/playing_interface'
require_relative '../lib/mastermind_menu'

class PlayingInterfaceTest < Minitest::Test

	def test_the_interface_exists
		interface = PlayingInterface.new
		assert true, interface
	end

end
