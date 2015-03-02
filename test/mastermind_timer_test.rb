require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require_relative '../lib/mastermind_timer'

class MastermindTest < Minitest::Test

  def test_it_exists
  	timer = MastermindTimer.new
  	assert timer
  end

  def test_it_can_format_minutes
  	timer  = MastermindTimer.new
  	start  = Time.new(2015, 10, 31, 12,18, 30, "+02:00")
  	finish = Time.new(2015, 10, 31, 12,22, 45, "+02:00")
  	timer.calculate_time(finish,start)
  	result = timer.minutes
  	assert_equal result, 4
  end

  def test_it_can_format_seconds
  	timer  = MastermindTimer.new
  	start  = Time.new(2015, 10, 31, 12,18, 30, "+02:00")
  	finish = Time.new(2015, 10, 31, 12,22, 45, "+02:00")
  	timer.calculate_time(finish,start)
  	result = timer.seconds
  	assert_equal result, 15
  end
end


