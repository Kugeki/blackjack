# frozen_string_literal: true

require_relative '../cards/cards'

class Dealer
  attr_accessor :cards

  def initialize
    @cards = Cards.new
  end

  def reset!
    self.cards = Cards.new
  end

  def choice
    if cards.points < 17 && cards.length < 3
      :add_card
    else
      :skip
    end
  end

  def add_card(card)
    cards.push(card)
    raise 'У диллера не может быть больше 3 карт' if cards.length > 3
  end
end
