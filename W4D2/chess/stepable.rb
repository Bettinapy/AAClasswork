module Stepable
    CONSTANT_KING = [
        [0,1],
        [1,0],
        [0,-1],
        [-1,0],
        [1,1],
        [-1,-1],
        [1,-1],
        [-1,1]       
].freeze
    CONSTANT_KNIGHT = [
        [2,1],
        [1,2],
        [-1,2],
        [-2,1],
        [-1,-2],
        [-2,-1],
        [2,-1],
        [1,-2]
    ]
  def moves
    # create array to collect moves
    arr = []
    # iterate through each of the piece's possible move_diffs
    row,col = self.pos
    move_diffs.each do |subarr|
        new_row = subarr[0] + row
        new_col = subarr[1] + col
        new_pos = [new_row,new_col]
        if (0..7).to_a.include?(new_row) && (0..7).to_a.include?(new_col)
          if self.board[new_pos].is_a?(NullPiece)
            arr << new_pos
          elsif self.board[new_pos].color != self.color
              arr << new_pos
          end
        end
    end
      # for each move_diff, increment the piece's position to generate a new position
      # add the new position to the moves array if it is:
        # on the board and empty
        # OR on the board and contains a piece of the opposite color
    arr
    # return the final array of moves
  end

  private

  def move_diffs
    # subclass implements this
    raise NotImplementedError
  end
end


# Note: you can invoke methods from the piece from within the module methods, and vice versa. It is a two way street!