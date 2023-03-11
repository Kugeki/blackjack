# frozen_string_literal: true

require_relative '../cards/cards'
require_relative '../cards/card'
require_relative '../game'

class Card
  def to_s
    "(#{name}, очки: #{values.join(' или ')})"
  end
end

class GameUi
  class << self
    def draw_tick(game, menu)
      clear
      draw_dealer(game.dealer)
      draw_user(game.user)
      draw_menu(menu)
    end

    def draw_dealer(dealer, hidden: true)
      if hidden
        puts "Карты диллера: #{'* ' * dealer.cards.length}"
      else
        puts 'Карты диллера:'
        puts dealer.cards
        puts "Cумма очков диллера: #{dealer.cards.points}"
      end
    end

    def draw_user(user)
      puts 'Ваши карты:'
      puts user.cards
      puts "Ваша сумма очков: #{user.cards.points}"
      puts
    end

    def draw_menu(menu)
      puts 'Выберите вариант:'
      puts menu.to_s
    end

    def draw_game_result(game, bet)
      clear
      draw_user(game.user)
      draw_dealer(game.dealer, hidden: false)
      draw_empty_line

      draw_bank_result(game, bet)
      draw_empty_line
    end

    def draw_bank_result(game, bet)
      case game.result
      when :win
        puts 'Вы выиграли!'
        puts "Получено денег: #{bet}"
      when :draw
        puts 'Ничья!'
        puts 'Деньги вернулись игрокам'
      when :lose
        puts 'Вы проиграли'
        puts "Потеряно денег: #{bet}"
      end
    end

    def draw_dealer_bank(bank)
      puts "Деньги диллера: #{bank.amount}."
    end

    def draw_user_bank(bank)
      puts "Ваши деньги: #{bank.amount}."
    end

    def draw_global_win
      puts 'Поздравляем! Вы полностью выиграли игру!'
    end

    def draw_global_lose
      puts 'К сожалению, вы проиграли игру.'
    end

    def draw_empty_line
      puts
    end

    def clear
      system('clear') || system('cls')
    end
  end
end
