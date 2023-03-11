# frozen_string_literal: true

require_relative 'bank'

class BankManager
  attr_accessor :user_bank, :dealer_bank, :main_bank

  def initialize(start_amount)
    @user_bank = Bank.new(start_amount)
    @dealer_bank = Bank.new(start_amount)
    @main_bank = Bank.new
  end

  def make_bet(bet)
    main_bank.give(dealer_bank.take(bet) + user_bank.take(bet))
  end

  def distribute_bets(game_result)
    case game_result
    when :win then distribute_win
    when :draw then distribute_draw
    when :lose then distribute_lose
    end
  end

  def distribute_win
    user_bank.give(main_bank.take_all)
  end

  def distribute_draw
    all = main_bank.take_all
    user_bank.give(all / 2)
    dealer_bank.give(all / 2)
  end

  def distribute_lose
    dealer_bank.give(main_bank.take_all)
  end
end
