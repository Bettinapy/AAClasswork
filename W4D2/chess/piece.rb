class Piece
    attr_reader :color, :board, :pos
    def initialize(color, board, pos)
        @pos = pos
        @color = color
        @board = board
    end
end