require 'rspec'
require 'card'

RSpec.describe Card do
  subject(:card) { Card.new(14, :spades) }

  describe "#initialize" do
    it "has a value" do
      expect(card.value).to eq(14)
    end

    it "has a suit" do
      expect(card.suit).to eq(:spades)
    end

    it "has an instance of card" do
      expect(card.card).to eq([14, :spades])
    end

    context "invalid card" do
      let(:invalid_card) { Card.new(15, :WTF) }

      it "raises an error if it has an invalid value" do
        expect { invalid_card.value }.to raise_error(ArgumentError)
      end

      it "raises an error if it has an invalid suit" do
        expect { invalid_card.suit }.to raise_error(ArgumentError)
      end

    end
  end
end
