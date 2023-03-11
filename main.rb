# frozen_string_literal: true

require_relative 'ui/game_ui'
require_relative 'game'
require_relative 'menu/menu'
require_relative 'user_input'

user_input = UserInput.new

menu = Menu.new
menu.add_choice(Choice.new('1', 'Пропустить', :skip))
menu.add_choice(Choice.new('2', 'Добавить карту', :add_card))
menu.add_choice(Choice.new('3', 'Открыть карты', :open_cards))

game = Game.new(User.new(menu, user_input), Dealer.new)

game.start
until game.ended?
  GameUi.draw_tick(game)
  game.tick
end

GameUi.draw_game_result(game)
