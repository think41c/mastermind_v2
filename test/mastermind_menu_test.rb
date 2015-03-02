require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require_relative '../lib/mastermind_menu'

class MastermindMenuTest < Minitest::Test

	def test_the_menu_exists
		menu = MastermindMenu.new
		assert true, menu
	end

	def test_the_menu_methods_exist
		menus = [:get_input, :menu, :quit, :invalid]
		menu = MastermindMenu.new
		menus.each do |method|
			assert menu.respond_to?(method)
		end			
	end

end