require_relative 'tic_tac_toe'

class TicTacToeNode
  attr_reader :board, :next_mover_mark, :prev_move_pos
  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end

  def losing_node?(evaluator)
    #base case
    return false if @board.over? && (@board.winner.nil? || @board.winner == evaluator)
    return true if @board.over? && @board.winner != evaluator
    res = children.map do |child|
      child.losing_node?(evaluator)
    end
    if @next_mover_mark != evaluator
      res.any? { |r| r == true }
    else
      res.all? { |r| r == true }
    end
  end

  def winning_node?(evaluator)
    #base case
    return true if @board.over? && @board.winner ==  evaluator
    return false if @board.over? && @board.winner != evaluator
    res = children.map do |child|
      child.winning_node?(evaluator)
    end
    if @next_mover_mark != evaluator
      res.all? {|r| r == true}
    else
      res.any? { |r| r == true }
    end

  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    matrix = @board.rows
    row = matrix.length
    col = matrix[0].length 
    new_arr = []
    (0...row).each do |i|
      (0...col).each do |j|
        pos = [i, j]
        if @board.empty?(pos)
          next_mark = ((@next_mover_mark == :x) ? :o : :x)
          new_board = @board.dup 
          new_board[pos] = @next_mover_mark
          previous_pos = pos
          board_node = TicTacToeNode.new(new_board, next_mark, previous_pos)
          new_arr << board_node 
        end
      end
    end
    new_arr
  end
end
