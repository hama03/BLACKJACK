# frozen_string_literal: true

# This class represents a card with a suit and a number

class Card
  attr_accessor :suit, :number

  def initialize(suit, number)
    @suit = suit
    @number = number
  end

  def to_s
    "#{suit}の#{number} "
  end

  def value
    return 11 if number == 'A'
    return 10 if %w[J Q K].include?(number)

    number.to_i
  end
end
