require 'rspec'
require 'deck'

RSpec.describe Deck do
  subject(:deck) { Deck.new }

  describe "#initialize" do
    it "has a cards array" do
      expect(deck.cards).to be_an_instance_of(Array)
    end

    it "has 52 unique elements" do
      expect(deck.cards.uniq).to eq(deck.cards)
    end

    it "is filled with Cards" do
      expect(deck.cards.all? { |card| card.is_a?(Card) }).to be true
    end

    it "has a discard array" do
      expect(deck.discard_pile).to be_an_instance_of(Array)
    end

    it "is shuffled" do
      expect(deck.cards).to_not eq(deck.cards.sort_by(&:value))
    end
  end


end
