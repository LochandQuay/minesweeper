require 'byebug'
require_relative 'tile'

class Board
  attr_reader :grid

  def initialize
    @grid = Array.new(9) { Array.new(9) {Tile.new} }
  end

  def set_mines
    10.times { place_mine }
  end

  def place_mine
    pos = random_location
    if self[pos].bombed?
      pos = random_location
    end

    self[pos].bombed = true
  end

  def determine_neighbors(tile, pos)
    tile.neighbors += 1
  end

  def render_neighbors
    @grid.each_index do |row|
      row.each_index do |col|
        determine_neighbors(self[row, col], [row, col])
      end
    end
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, value)
    row, col = pos
    @grid[row][col] = value
  end

  def random_location
    [rand(9), rand(9)]
  end

  def render
    puts "-------------------"
    @grid.each do |row|
      print "|"
      row.each do |tile|
        if tile.nil?
          print " |"
        else
          print tile + "|"
        end
      end
      puts "\n-------------------"

    end
  end
end

board = Board.new

board.set_mines

p board
