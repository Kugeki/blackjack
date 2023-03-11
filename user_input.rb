# frozen_string_literal: true

require_relative 'menu/menu'
require_relative 'menu/choice'

class UserInput
  def choice_from_menu(menu)
    loop do
      input = gets.chomp
      choice = menu.value_by_input(input)

      return choice unless choice.nil?
    end
  end
end
