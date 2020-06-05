require_relative "piece"
require_relative "stepable"
class King < Piece
  include Stepable
  def move_diffs
    CONSTANT_KING
  end

end