require 'byebug'

SUITS = [:clubs, :diamonds, :hearts, :spades]

class Card
  attr_reader :card, :value, :suit, :card_value


  def initialize(value, suit)
    raise ArgumentError unless value.between?(2, 14)
    raise ArgumentError unless SUITS.include?(suit)

    @value = value
    @suit = suit
    @card = [value, suit]
    # @card_value = card_value_set
  end

  def card_value_set
    if value < 11
      value
    elsif value == 11
      "Jack"
    elsif value == 12
      "Queen"
    elsif value == 13
      "King"
    elsif value == 14
      "Ace"
    end
  end


  def inspect
    "#{card_value_set} of #{suit}"
  end
end
