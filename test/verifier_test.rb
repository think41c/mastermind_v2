require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require_relative '../lib/playing_interface'
require_relative '../lib/verifier'

class VerifierTest < Minitest::Test

	def test_it_exists
		assert true
	end

	def test_it_can_make_sure_user_puts_right_colors
		verifier = Verifier.new
		result = verifier.right_colors?(["r", "g", "b", "y"])
		assert_equal true, result
	end

	def test_it_can_make_sure_user_puts_wrong_colors
		verifier = Verifier.new
		result = verifier.right_colors?(["z", "x", "b", "y"])
		assert_equal false, result
	end

	def test_it_can_make_sure_user_puts_right_chars
		verifier = Verifier.new
		result = verifier.right_number_chars?(["z", "x", "b", "y"])
		assert_equal true, result
	end

	def test_it_can_make_sure_user_puts_wrong_chars
		verifier = Verifier.new
		result = verifier.right_number_chars?(["z", "x", "b", "y", "p"])
		assert_equal nil, result
	end

	def test_it_responds_to_messages 
		verifier = Verifier.new
		assert verifier.respond_to? :messages
	end
end
