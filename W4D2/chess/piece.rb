class Piece
    attr_reader :color, :board, :pos
    attr_writer :pos
    def initialize(color, board, pos)
        @pos = pos
        @color = color
        @board = board
    end

    def inspect
        "#{color},#{pos}, #{self.class}"
    end


end