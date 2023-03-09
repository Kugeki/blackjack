# frozen_string_literal: true

class Card
  attr_accessor :name, :value

  def initialize(name)
    @name = name
    @value = name_to_value(name)
  end

  def ace?
    name[0] == 'T'
  end

  def number?
    name[0].match?(/[1-9]/)
  end

  def name_to_value(name)
    return [name.to_i] if number?
    return [1, 11] if ace?

    [10]
  end
end
