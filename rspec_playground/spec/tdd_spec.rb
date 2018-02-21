require 'rspec'
require 'tdd'

RSpec.describe Array do
  describe "#my_uniq" do
    it "removes repeat elements" do
      expect([1, 2, 1, 1].my_uniq).to eq([1, 2])
    end

    it "can handle an empty array" do
      expect([].my_uniq).to be_empty
    end

    it "can handle a unique array" do
      expect([1, 2, 3].my_uniq).to eq([1, 2, 3])
    end

    it "should not call Array#uniq" do
      expect([1, 2, 3, 4].my_uniq).to_not receive(:uniq)
    end
  end

  describe "#two_sum" do
    it "finds all index pairs that sums to zero if available" do
      expect([1, 2, -1, -2, 0].two_sum).to eq([[0, 2], [1, 3]])
    end

    it "returns an empty array if none available" do
      expect([1,2,3,4].two_sum).to be_empty
    end
  end

  describe "#my_transpose" do
    subject(:arr) {[[1, 2, 3], [4, 5, 6], [7, 8, 9]]}
    let(:large_arr) {[[1, 2, 3, 4], [5, 6, 7, 8], [9, 10, 11, 12], [13, 14, 15, 16]]}

    it "should not use Array#transpose" do
      expect(arr.my_transpose).to_not receive(:transpose)
    end

    it "transposes the array" do
      expect(arr.my_transpose).to eq([[1, 4, 7], [2, 5, 8], [3, 6, 9]])
    end

    context "different size arrays" do
      it "handles a small array" do
        expect([[1,2], [3, 4]].my_transpose).to eq([[1, 3], [2, 4]])
      end

      it "handles a medium array" do
        expect([[1, 2, 3], [4, 5, 6]].my_transpose).to eq([[1, 4],[2, 5], [3, 6]])
      end


      it "handles a large array" do
        expect(large_arr.my_transpose).to eq(large_arr.transpose)
      end
    end
  end

  describe "#stock_pickers" do
    subject(:stocks_prices) {[97, 56, 87, 10, 15, 75, 94]}

    # If there are no profitable days ....

    it "returns an array" do
      expect(stocks_prices.stock_pickers).to be_a_instance_of(Array)
    end

    it "correctly chooses the best profitable day-pair" do
      expect(stocks_prices.stock_pickers).to eq([3, 6])
    end
  end

end

RSpec.describe TowersOfHanoi do
  subject(:tower) { TowersOfHanoi.new }

  describe "#initialize" do
    it "has three towers" do
      expect(tower.towers.length).to eq(3)
    end

    it "starts the 1st tower with three elements" do
      expect(tower.towers[0].length).to eq(3)
    end

    it "places elements in correct order" do
      expect(tower.towers[0]).to eq(tower.towers[0].sort)
    end
  end

  describe "#move_disc" do

    it "raises an error if start tower doesn't have a disc" do
      expect {tower.move_disc(1, 2)}.to raise_error(ArgumentError)
    end


    it "raises error if moving a larger disc to a smaller disc" do
      tower.towers = [[1], [2], [3]]
      expect{tower.move_disc(2, 0)}.to raise_error(ArgumentError)
    end

    it "raises error if it is not a valid tower position" do
      expect{tower.move_disc(4, 0)}.to raise_error(ArgumentError)
    end

    it "moves a disc" do
      tower.move_disc(0, 1)
      expect(tower.towers).to eq([[2, 3], [1], []])
    end
  end

  describe "#won?" do
    it "checks if all the discs to a single tower" do
      tower.towers = [[], [1, 2, 3], []]
      expect(tower).to be_won
    end

    it "checks if the start tower is empty" do
      expect(tower.won?).to be false
    end
  end
end


























# end
