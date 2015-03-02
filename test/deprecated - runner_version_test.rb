require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './runner_version'

class MastermindTest < Minitest::Test
  attr_reader :msg, :mastermind

  def setup
    game = Game.new
  end

  def test_it_exists
    assert Game
  end

  def test_it_has_an_opening_message
    mastermind = Mm.new
    messages   = Output.new
    assert_equal messages.goodbye, "\nThanks for playing!\n"
  end

  def test_it_can_display_instructions
    mastermind = Mm.new
    messages  = Output.new
    input = 'i'
    assert messages.instructions, true
  end

  def test_the_random_sequence_has_4_colors
    mastermind = Mm.new
    messages  = Output.new
    mastermind.random_sequence
    assert_equal mastermind.sequence.length, 4
  end

  def test_the_random_sequence_doesnt_include_invalid_letters
    mastermind = Mm.new
    messages  = Output.new
    mastermind.random_sequence
    assert_equal mastermind.sequence.include?("u"), false 
  end

  def test_you_can_change_the_number_of_sequences_needed_to_pick
    mastermind = Mm.new
    messages  = Output.new
    mastermind.num_of_sequence = 6
    mastermind.random_sequence
    assert_equal mastermind.sequence.length, 6
  end

  def test_it_gets_positions_and_colors_right
    mastermind = Mm.new
    messages = Output.new
    mastermind.sequence = "rrrr"
    mastermind.input = "rrrr"
    mastermind.evaluate_wrong_guess("rrrr")
    assert_equal mastermind.right_position, 4
  end

  def test_it_tells_you_if_you_type_too_many_characters
    mastermind = Mm.new
    messages = Output.new
    mastermind.sequence = "rrrr"
    mastermind.input = "rrrrzzzzz"
    mastermind.evaluate_wrong_guess("rrrrzzzzz")
    assert_equal mastermind.character_length_good, false
  end

  def test_it_tells_you_if_you_type_the_right_amount_of_characters
    mastermind = Mm.new
    messages = Output.new
    mastermind.sequence = "rrrr"
    mastermind.input = "rrrr"
    mastermind.evaluate_wrong_guess("rrrr")
    assert_equal mastermind.character_length_good, true
  end

  def test_it_can_tell_if_you_type_4_right_colors_in_a_sequence
    mastermind = Mm.new
    messages = Output.new
    mastermind.sequence = "ygrb"
    mastermind.input = "grby"
    mastermind.evaluate_wrong_guess("grby")
    assert_equal mastermind.right_color, 4
  end
  
end
