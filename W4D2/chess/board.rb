require_relative "piece"
require_relative "null_piece"
require_relative "bishop"
require_relative "knight"
require_relative "pawn"
require_relative "queen"
require_relative "king"
require_relative "rook"

require "byebug"
class Board
    attr_accessor :board
    def set_piece
        @board[1].each_with_index {|col,i| @board[1][i] = Pawn.new("white",self,[1,i])}
        @board[6].each_with_index {|col,i| @board[6][i] = Pawn.new("black",self,[6,i])}
        @board[0][0] = Rook.new("white", self, [0,0])
        @board[0][7] = Rook.new("white", self, [0,7])

        @board[7][0] = Rook.new("black", self, [7,0])
        @board[7][7] = Rook.new("black", self, [7,7])


        @board[0][1] = Knight.new("white", self, [0,1])
        @board[0][6] = Knight.new("white", self, [0,6])
        @board[7][1] = Knight.new("black", self, [7,1])
        @board[7][6] = Knight.new("black", self, [7,6])


        @board[0][2] = Bishop.new("white", self, [0,2])
        @board[0][5] = Bishop.new("white", self, [0,5])
        @board[7][2] = Bishop.new("black", self, [7,2])
        @board[7][5] = Bishop.new("black", self, [7,5])

        @board[0][3] = Queen.new("white", self, [0,3])
        @board[7][3] = Queen.new("black", self, [7,3])
       
        @board[0][4] = King.new("white", self, [0,4])
        @board[7][4] = King.new("black", self, [7,4])

        (2..5).each do  |row| 
            (0..7).each do |col|
                @board[row][col] = NullPiece.instance
            end
        end
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
        raise "start position is not valid" if self[start_pos].is_a?(NullPiece) || start_pos[0] < 0 || start_pos[1] > 7
        raise "end position is not valid" if end_pos[0] < 0 || end_pos[1] > 7
        # all_moves = self[start_pos].moves
        # raise "invalid move for the piece" if !all_moves.include?(end_pos)
        current_piece = self[start_pos] 
        current_piece.pos = end_pos
        self[start_pos] = NullPiece.instance
        self[end_pos] = current_piece
    end


end

