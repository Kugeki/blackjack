# frozen_string_literal: true

require_relative '../cards/cards'
require_relative '../user_input'

class User
  attr_accessor :cards, :choice

  def initialize
    @cards = Cards.new
  end

  def reset!
    self.cards = Cards.new
  end

  def add_card(card)
    cards.push(card)
  end
end
