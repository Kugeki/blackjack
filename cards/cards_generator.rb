# frozen_string_literal: true

require_relative 'card'

class CardsGenerator
  def suits
    %w[+ <3 ^ <>]
  end

  def types
    %w[2 3 4 5 6 7 8 9 10 J K Q T]
  end

  def names
    types.map { |name| suits.map { |suit| name + suit } }.flatten
  end

  def generate
    names.map { |name| Card.new(name) }
  end
end
