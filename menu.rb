# frozen_string_literal: true

require_relative 'choice'

class Menu
  def initialize(choices = [])
    @choices = choices
  end

  def add_choice(choice)
    @choices.push(choice)
  end

  def select_choices(&block)
    @choices.select(&block)
  end

  def select_choices!(&block)
    @choices = select_choices(&block)
  end

  def value_by_input(input)
    @choices.find { |x| x.text == input }&.value
  end

  def to_s
    @choices.each_with_object(String.new) do |choice, s|
      s << "(#{choice.text}) #{choice.description}.\n"
    end
  end
end
