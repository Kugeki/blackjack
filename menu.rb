# frozen_string_literal: true

require_relative 'choice'

class Menu
  def initialize(choices = [])
    @choices = choices
  end

  def add_choice(choice)
    @choices.push(choice)
  end

  def choice_by_value(choice_value)
    @choices.find { |x| x.value == choice_value }
  end

  def hide_choice(choice_value)
    choice_by_value(choice_value).active = false
  end

  def show_choice(choice_value)
    choice_by_value(choice_value).active = true
  end

  def value_by_input(input)
    @choices.find { |x| x.text == input && x.active? }&.value
  end

  def to_s
    @choices.each_with_object(String.new) do |choice, s|
      s << "(#{choice.text}) #{choice.description}.\n" if choice.active?
    end
  end
end
