require 'byebug'

class Array
  def my_uniq
    uniq_array = []
    each do |el|
      uniq_array << el unless uniq_array.include?(el)
    end

    uniq_array
  end

  def two_sum
    pair_idx = []
    each_index do |idx1|
      each_index do |idx2|
        next if idx2 <= idx1
        if self[idx1] + self[idx2] == 0
          pair_idx << [idx1, idx2]
        end
      end
    end

    pair_idx
  end

  def my_transpose
    new_arr = Array.new(self[0].length) { Array.new }

    each_with_index do |row, idx1|
      row.each_index do |idx2|
        new_arr[idx2][idx1] = self[idx1][idx2]
      end
    end

    new_arr
  end

  def stock_pickers
    profit_hash = {}

    (0...length).to_a.combination(2) do |idx1, idx2|
      profit_hash[ self[idx2] - self[idx1] ] = [idx1, idx2]
    end

    profit_hash.sort_by{|k, v| k}.last.last
  end
end



class TowersOfHanoi
  attr_accessor :towers

  def initialize
    @towers = [[1, 2, 3], [], []]
  end

  def move_disc(start_tower, end_tower)
    raise ArgumentError unless start_tower.between?(0, 2) && end_tower.between?(0, 2)
    if towers[start_tower].empty?
      raise ArgumentError.new("Start tower cannot be empty.")
    elsif !towers[end_tower].empty?
      if towers[end_tower].first < towers[start_tower].first
        raise ArgumentError.new("Cannot move larger disc onto a smaller disc.")
      end
    end

    disc = towers[start_tower].shift

    towers[end_tower].unshift(disc)

    "We moved a disc!!! We be feeling floppy.."
  end

  def won?
    if towers.any? { |tower| tower.length == 3 }
      return true if towers[0].empty?
    end

    false
  end
end





















# end
