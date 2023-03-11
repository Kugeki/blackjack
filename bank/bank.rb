# frozen_string_literal: true

class Bank
  attr_reader :amount

  def initialize(amount = 0)
    @amount = amount
  end

  def take(count)
    @amount -= count
    count
  end

  def take_all
    count = @amount
    @amount = 0
    count
  end

  def give(count)
    @amount += count
  end

  def empty?
    @amount <= 0
  end
end
