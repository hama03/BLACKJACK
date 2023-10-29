# frozen_string_literal: true

require_relative 'card'

class Hand
  attr_accessor :cards

  def initialize
    @cards = []
  end

  def add_card(card)
    cards << card
  end

  def value
    sum = 0
    aces = 0
    cards.each do |card|
      sum += card.value
      aces += 1 if card.number == 'A'
    end

    while sum > 21 && aces > 0
      sum -= 10
      aces -= 1
    end
    sum
  end
end
