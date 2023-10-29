# frozen_string_literal: true

require_relative 'deck'
require_relative 'player'
require_relative 'dealer'

class Game
  def initialize
    @deck = Deck.new
    @player = Player.new
    @dealer = Dealer.new
  end

  def start
    2.times do
      @player.hit(@deck.deal_card)
      @dealer.hit(@deck.deal_card)
    end

    show_initial_cards

    player_turn
    dealer_turn unless @player.value > 21

    show_result
  end

  private

  def player_turn
    while @player.value < 21
      puts "あなたの現在の得点は#{@player.value}です。カードを引きますか？（Y/N）"
      answer = gets.chomp.upcase
      break if answer == 'N'

      @player.hit(@deck.deal_card)
      @player.show_hand
    end
  end

  def dealer_turn
    @dealer.hit(@deck.deal_card) while @dealer.value < 17
  end

  def show_initial_cards
    @player.show_hand
    @dealer.show_first_card
  end

  def show_result
    puts "あなたの得点は#{@player.value}です。"
    puts "ディーラーの得点は#{@dealer.value}です。"
    if @player.value > 21
      puts 'バスト！あなたの負けです。'
    elsif @dealer.value > 21 || @player.value > @dealer.value
      puts 'あなたの勝ちです！'
    elsif @player.value == @dealer.value
      puts '引き分けです。'
    else
      puts 'あなたの負けです。'
    end
  end
end
