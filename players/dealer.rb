# frozen_string_literal: true

require_relative '../cards/cards'
require_relative 'player'

class Dealer < Player
  def choice
    if cards.points < 17 && cards.length < 3
      :add_card
    else
      :skip
    end
  end
end
