# frozen_string_literal: true

require_relative 'ui/game_ui'
require_relative 'game'
require_relative 'menu/menu'
require_relative 'user_input'
require_relative 'bank/bank'
require_relative 'bank/bank_manager'

bank_manager = BankManager.new(100)

user_input = UserInput.new

quit_menu = Menu.new
quit_menu.add_choice(Choice.new('1', 'Выйти', :quit))
quit_menu.add_choice(Choice.new('2', 'Продолжить', :continue))

menu = Menu.new
menu.add_choice(Choice.new('1', 'Пропустить', :skip))
menu.add_choice(Choice.new('2', 'Добавить карту', :add_card))
menu.add_choice(Choice.new('3', 'Открыть карты', :open_cards))

game = Game.new(User.new(menu, user_input), Dealer.new)

loop do
  bank_manager.make_bet(10)

  game.start
  until game.ended?
    GameUi.draw_tick(game)
    game.tick(user_input.choice_from_menu(menu))
  end

  GameUi.draw_game_result(game, bank_manager.main_bank.amount)

  bank_manager.distribute_bets(game.result)

  GameUi.draw_dealer_bank(bank_manager.dealer_bank)
  GameUi.draw_user_bank(bank_manager.user_bank)

  if bank_manager.dealer_bank.empty?
    GameUi.draw_global_win
    break
  end

  if bank_manager.user_bank.empty?
    GameUi.draw_global_lose
    break
  end

  GameUi.draw_empty_line
  GameUi.draw_menu(quit_menu)
  break if user_input.choice_from_menu(quit_menu) == :quit
end
