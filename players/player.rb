# frozen_string_literal: true

class Player
  attr_accessor :cards

  def initialize
    @cards = Cards.new
  end

  def reset!
    self.cards = Cards.new
  end

  def add_card(card)
    raise 'У игрока не может быть больше 3 карт' if cards.length > 2

    cards.push(card)
  end
end
