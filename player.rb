# frozen_string_literal: true

require_relative 'hand'

class Player
  attr_accessor :hand

  def initialize
    @hand = Hand.new
  end

  def hit(card)
    hand.add_card(card)
  end

  def show_hand
    hand.cards.each { |card| puts card }
  end

  def value
    hand.value
  end
end
