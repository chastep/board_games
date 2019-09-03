class Board
  attr_accessor :grid

  def initialize
    @grid = {
      a1: '-',
      a2: '-',
      a3: '-',
      b1: '-',
      b2: '-',
      b3: '-',
      c1: '-',
      c2: '-',
      c3: '-'
    }
  end

  def winning_patterns
    [
      # rows
      [grid[:a1],grid[:a2],grid[:a3]],
      [grid[:b1],grid[:b2],grid[:b3]],
      [grid[:c1],grid[:c2],grid[:c3]],
      # columns
      [grid[:a1],grid[:b1],grid[:c1]],
      [grid[:a2],grid[:b2],grid[:c2]],
      [grid[:a3],grid[:b3],grid[:c3]],
      # diagionals
      [grid[:a1],grid[:b2],grid[:c3]],
      [grid[:a3],grid[:b2],grid[:c1]]
    ]
  end

  def display
    puts "CURRENT BOARD STATE"
    puts <<-PRINT
        1   2   3
      A #{grid[:a1]} | #{grid[:a2]} | #{grid[:a3]}
        ---------
      B #{grid[:b1]} | #{grid[:b2]} | #{grid[:b3]}
        ---------
      C #{grid[:c1]} | #{grid[:c2]} | #{grid[:c3]}
    PRINT
  end

  def count
    {
      X: grid.values.count('X'),
      O: grid.values.count('O')
    }
  end
end
