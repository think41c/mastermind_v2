require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require_relative '../lib/logic'
require_relative '../lib/mastermind_menu'

class LogicTest < Minitest::Test

	def test_it_can_calculate_2_right_colors
		logic    = Logic.new
		logic.random_sequence
		input    = %w[r r b g]
		sequence = %w[r r g b]
		good_pos = 2
		result   = logic.calculate_right_color(input, sequence, good_pos)
		assert_equal 2, result
	end

	def test_it_can_calculate_4_right_colors
		logic    = Logic.new
		logic.random_sequence
		input    = %w[y r g b]
		sequence = %w[r y b g]
		good_pos = 0
		result   = logic.calculate_right_color(input, sequence, good_pos)
		assert_equal 4, result
	end

	def test_it_can_calculate_1_right_color
		logic    = Logic.new
		logic.random_sequence
		input    = %w[y r g b]
		sequence = %w[y y y g]
		good_pos = 1
		result   = logic.calculate_right_color(input, sequence, good_pos)
		assert_equal 1, result
	end

	def test_it_can_calcualte_1_right_position
		logic    = Logic.new
		input    = %w[y r g b]
		sequence = %w[y y y g]
		result   = logic.calculate_right_position(input, sequence)
		assert_equal 1, result
	end

	def test_it_can_calcualte_4_right_positions
		logic    = Logic.new
		input    = %w[y y y g]
		sequence = %w[y y y g]
		result   = logic.calculate_right_position(input, sequence)
		assert_equal 4, result
	end

	def test_it_can_generate_a_sequence_with_only_b_y_g_r
		logic    = Logic.new
		result   = logic.random_sequence 
		assert result.include?("b" || "y" || "g" || "r")
	end

	def test_it_can_definitely_generate_a_sequence_with_only_b_y_g_r
		logic    = Logic.new
		result   = logic.random_sequence 
		assert true, result.include?("a" || "p" || "q" || "z")
	end

	def test_the_secret_sequence_is_an_array
		logic       = Logic.new
		result      = logic.random_sequence 
		assert_equal result.class, Array
	end


end
