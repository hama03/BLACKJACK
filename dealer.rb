# frozen_string_literal: true

require_relative 'player'

class Dealer < Player
  def show_first_card
    puts "ディーラーの最初のカード: #{@hand.cards.first}"
  end
end
