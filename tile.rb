class Tile
  attr_accessor :revealed, :flagged, :bombed, :neighbors
  def initialize
    # @position = pos
    @revealed = false
    @flagged = false
    @bombed = false
    @neighbors = 0
  end

  def reveal
    @revealed = true
  end

  def neighbor_bomb_count(board)

  end

  def bombed?
    @bombed
  end

  def flagged?
    @flagged
  end

  def revealed?
    @revealed
  end
end
