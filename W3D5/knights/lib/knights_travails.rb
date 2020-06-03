require_relative "00_tree_node"

class KnightPathFinder
    # kpf.instance_variable_get(:@considered_positions).length
    
    def self.valid_moves(position)
        # check if moves are available position on the board
        row = position[0]
        col = position[1]
        valid_positions = []
        all_positions = [[row + 2, col + 1],[row + 2, col - 1], 
        [row - 2, col + 1], [row - 2, col -1], [row + 1, col + 2], 
        [row + 1, col - 2], [row - 1, col + 2 ], [row - 1, col - 2]]
        all_positions.each { |pos| valid_positions << pos if KnightPathFinder.is_valid?(pos)}
        valid_positions
    end

    def self.is_valid?(position)
        row = position[0]
        col = position[1]
        return false if row > 7 || col > 7 || row < 0 || col < 0
        true
    end


    def initialize(starting_pos)
        @starting_pos = starting_pos
        @root_node = PolyTreeNode.new(starting_pos)
        @considered_positions = [starting_pos]
        build_move_tree(@root_node)
    end

    def new_move_positions(pos)
        valid_pos = KnightPathFinder.valid_moves(pos)
        new_moves = []
        valid_pos.each do |pos| 
            if !@considered_positions.include?(pos)
                @considered_positions << pos
                new_moves << pos
            end
        end
        new_moves
    end

    def build_move_tree(root_node)
        queue = [root_node]
        until queue.empty?
            node = queue.shift
            pos = node.value
            new_moves = new_move_positions(pos)
            new_moves.each { |pos| node.add_child(PolyTreeNode.new(pos)) }
            queue += node.children
        end
    end

    def find_path(end_pos)
        end_node = @root_node.dfs(end_pos) 
        trace_path_back(end_node) 
    end
    
   
    # start = [6,2]
    # start.parent = [4,1]
    # start = [4,1]
    # start.parent = [2,0]
    # start = [2,0]
    # start.parent...
    # ...
    # stop when the parent is [0,0]

     # kpf.find_path([6, 2]) # => [[0, 0], [1, 2], [2, 0], [4, 1], [6, 2]]
    def trace_path_back(end_node)
        arr = []
        start = end_node 
        arr << end_node.value 
        until start == @root_node
            parent = start.parent 
            arr.unshift(parent.value) 
            start = parent 
        end
        arr
    end

end