# frozen_string_literal: true

require_relative 'cards/cards_manager'
require_relative 'cards/cards'
require_relative 'players/user'
require_relative 'players/dealer'

class Game
  attr_accessor :manager, :user, :dealer

  def initialize(user, dealer)
    @manager = CardsManager.new

    @user = user
    @dealer = dealer

    @game_end = false
  end

  def reset
    user.reset!
    dealer.reset!
    manager.generate_pool! if manager.count < 6

    @game_end = false
    @result = nil
  end

  def start
    reset
    give_cards
  end

  def tick
    process user
    process dealer unless ended?
    @game_end = true if user.cards.length == 3 && dealer.cards.length == 3
  end

  def result
    @result ||=
      if user.cards > dealer.cards
        :win
      elsif user.cards == dealer.cards
        :draw
      else
        :lose
      end
    @result
  end

  def give_cards
    user.add_card(manager.give_card)
    user.add_card(manager.give_card)

    dealer.add_card(manager.give_card)
    dealer.add_card(manager.give_card)
  end

  def process(player)
    case player.choice
    when :add_card then player.add_card(manager.give_card)
    when :open_cards then @game_end = true
    end
  end

  def ended?
    @game_end
  end
end
