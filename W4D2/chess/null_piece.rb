require_relative "piece"

class NullPiece < Piece
    def initialize(color, board, pos)
        @color = nil
        @board = board
        @pos = pos

    end


end