module Slideable
require "byebug"
  # HORIZONTAL_DIRS stores an array of horizontal directions
    # when a piece moves in a given direction, its row and/or its column should increment by some value
    # ex: A piece starts at position [1, 2] and it moves horizontally to the right
      # its position changes to [1,3]
      # the row increases by 0 and the column increases by 1
  HORIZONTAL_DIRS = [
    [0, -1], # left
    [0, 1], # right
    [1, 0], # up (vertical)
    [-1, 0]  # down (vertical)
  ].freeze

  DIAGONAL_DIRS = [
    [1, -1], # up + left
    [1, 1], # up + right
    [-1, -1], # down + left
    [-1, 1]  # down + right
  ].freeze


  def horizontal_dirs
    HORIZONTAL_DIRS
  end

  def diagonal_dirs
    DIAGONAL_DIRS
  end


  # should return an array of places a Piece can move to
  def moves
    # create array to collect moves
    arr = []
    move_dirs.each do |direction|
        dx = direction[0] 
        dy = direction[1]
        arr += grow_unblocked_moves_in_dir(dx, dy)
    end
    arr
    # iterate over each of the directions in which a slideable piece can move
      # use the Piece subclass' `#move_dirs` method to get this info
      # for each direction, collect all possible moves in that direction
        # and add them to your moves array 
        # (use the `grow_unblocked_moves_in_dir` helper method)

    # return the final array of moves (containing all possible moves in all directions)
  end


#   private

  def move_dirs
    # subclass implements this
    raise NotImplementedError # this only executes if 
  end


  # this helper method is only responsible for collecting all moves in a given direction
  # the given direction is represented by two args, the combination of a dx and dy
  def grow_unblocked_moves_in_dir(dx, dy) 
    # create an array to collect moves
    arr = []
    
    # get the piece's current row and current column
    row, col = self.pos 
    # in a loop:
      # continually increment the piece's current row and current column to generate a new position
      # stop looping if the new position is invalid (not on the board); the piece can't move in this direction
      # if the new position is empty, the piece can move here, so add the new position to the moves array
      # if the new position is occupied with a piece of the opposite color, the piece can move here (to capture the opposing piece), so add the new position to the moves array
        # but, the piece cannot continue to move past this piece, so stop looping
      # if the new position is occupied with a piece of the same color, stop looping
    new_row = row + dx
    new_col = col + dy
    new_pos = [new_row, new_col]  
    while new_row >= 0 && new_row <= 7  && new_col >=0 && new_col <= 7
        if self.board[new_pos].is_a?(NullPiece)
            arr << [new_row, new_col]
            new_row += dx 
            new_col += dy 
            new_pos = [new_row, new_col]  
        else
           
            if self.board[new_pos].color != self.color
                arr << new_pos
                break
            else
                break
            end 
        end
    end

    # return the final moves array
    arr
  end
end
