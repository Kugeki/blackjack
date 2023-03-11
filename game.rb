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

    @result = nil
  end

  def start
    reset
    give_cards
  end

  def tick(user_choice)
    user.choice = user_choice

    return :end if process(user) == :end
    return :end if process(dealer) == :end
    return :end if user.cards.length == 3 && dealer.cards.length == 3

    :continue
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
    when :add_card
      player.add_card(manager.give_card)
      :continue
    when :open_cards then :end
    end
  end
end
