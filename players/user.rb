# frozen_string_literal: true

require_relative '../cards/cards'

class User
  attr_accessor :menu, :cards

  def initialize(menu)
    @menu = menu
    @cards = Cards.new
  end

  def reset!
    menu.show_all!
    self.cards = Cards.new
  end

  def choice
    loop do
      input = gets.chomp
      choice = menu.value_by_input(input)

      return choice unless choice.nil?
    end
  end

  def add_card(card)
    cards.push(card)
    menu.hide_choice!(:add_card) if cards.length > 2
  end
end