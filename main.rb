# frozen_string_literal: true

require_relative 'game'
require_relative 'menu/menu'

menu = Menu.new
menu.add_choice(Choice.new('1', 'Пропустить', :skip))
menu.add_choice(Choice.new('2', 'Добавить карту', :add_card))
menu.add_choice(Choice.new('3', 'Открыть карты', :open_cards))

game = Game.new(User.new(menu), Dealer.new)

game.start
until game.ended?
  game.tick
end
