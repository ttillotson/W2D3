require 'byebug'
require_relative 'card'

class Deck

  attr_reader :cards, :discard_pile
  # attr_accessor

  def initialize
    @cards = build_deck
    @discard_pile = []
  end

  def build_deck
    deck = []

    (2..14).each do |value|
      Card::SUITS.each do |suit|
        deck << Card.new(value, suit)
      end
    end

    deck.shuffle!
  end
end
