# frozen_string_literal: true

require_relative 'card'

class Deck
  SUITS = %w[Hearts Diamonds Clubs Spades].freeze
  NUMBERS = %w[A 2 3 4 5 6 7 8 9 10 J Q K].freeze

  attr_accessor :cards

  def initialize
    @cards = SUITS.product(NUMBERS).map { |suit, number| Card.new(suit, number) }
    shuffle!
  end

  def shuffle!
    cards.shuffle!
  end

  def deal_card
    cards.pop
  end
end
