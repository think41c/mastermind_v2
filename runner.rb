require_relative './lib/mastermind_menu'
require_relative './lib/user_messages'

@messages = UserMessages.new
@menu     = MastermindMenu.new
@messages.clearing
@menu.menu