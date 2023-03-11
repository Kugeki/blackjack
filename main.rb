# frozen_string_literal: true

require_relative 'menu/menu'

menu = Menu.new
menu.add_choice(Choice.new('1', 'Пропустить', :skip))
menu.add_choice(Choice.new('2', 'Добавить карту', :add_card))
menu.add_choice(Choice.new('3', 'Открыть карты', :open_cards))

puts 'Выберите вариант:'
puts menu.to_s

input = gets.chomp
puts menu.value_by_input(input) || 'Неправильный ввод.'
