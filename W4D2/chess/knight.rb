require_relative "piece"
require_relative "stepable"
class Knight < Piece
    include Stepable
    def move_diffs
        CONSTANT_KNIGHT
    end

end