require 'byebug'


class PolyTreeNode
    attr_reader :value, :parent, :children

    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end

    def parent=(node)   
        if @parent != nil
            @parent.children.delete(self) 
            @parent = node
            return nil if node == nil
            node.children << self
        else
            @parent = node
            node.children << self if !node.children.include?(self)
        end
    end

    def add_child(child_node)
        child_node.parent = self
    end 

    def remove_child(child_node)
        child_node.parent = nil
    end

    def dfs(target_value)
        return self if self.value == target_value
        
        self.children.each do |child|
            result = child.dfs(target_value)
            if result != nil
                return result
            end
        end
        nil
    end

    def bfs(target_value)
        q = []
        q << self
        while !q.empty?
            ele = q.shift
            if ele.value != target_value
                q += ele.children
            else   
                return ele
            end
        end
    end

    def inspect
        @value.inspect
    end
    
end
