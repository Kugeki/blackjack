# frozen_string_literal: true

require_relative 'cards_generator'

class CardsManager
  def initialize(generator = nil)
    @generator = generator || CardsGenerator.new
    @pool = []
    generate_pool!
  end

  def generate_pool!
    @pool = @generator.generate
  end

  def give_card
    @pool.sample.tap { |card| @pool.delete(card) }
  end

  def count
    @pool.length
  end
end
