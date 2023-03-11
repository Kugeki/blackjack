# frozen_string_literal: true

require_relative '../cards/cards'
require_relative '../user_input'

class User
  attr_accessor :menu, :cards, :choice

  def initialize(menu, input)
    @menu = menu
    @cards = Cards.new
    @input = input
  end

  def reset!
    menu.show_all!
    self.cards = Cards.new
  end

  def add_card(card)
    cards.push(card)
    menu.hide_choice!(:add_card) if cards.length > 2
  end
end
