# frozen_string_literal: true

require_relative '../cards/cards'
require_relative '../user_input'
require_relative 'player'

class User < Player
  attr_accessor :choice
end
