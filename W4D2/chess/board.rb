require_relative "piece"
require_relative "null_piece"
require_relative "sliding_piece"
require_relative "stepping_piece"
require_relative "pawn"

class Board
    attr_accessor :board
    def set_piece
        @board[0][0] = Pawn.new('white', self, [0,0])
        
    end
    
    def initialize
        @board = Array.new(8){Array.new(8)}
        set_piece
    end
 
    def [](pos)
        row, col = pos
        @board[row][col]
    end

    def []=(pos, value)
        row, col = pos
        @board[row][col] = value
    end

    def move_piece(start_pos, end_pos)
        raise "start position is not valid" if @board[start_pos].nil?
        raise "end position is occupied" if !@board[end_pos].nil?
        current_piece = @board[start_pos] 
        @board[start_pos] = nil
        @board[end_pos] = current_piece
    end
end