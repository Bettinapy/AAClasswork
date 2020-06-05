class MoveError < StandardError
    def message
       puts "cannot move"
    end
end

class Hanoi
    require "byebug"
    DISCS = [3,2,1]
    attr_accessor :pile1, :pile2, :pile3
    def initialize
        @pile1 = [3,2,1]
        @pile2 = []
        @pile3 = []
    end

    def get_pile(pile_name)
        if pile_name == "pile1"
            @pile1
        elsif pile_name == "pile2"
            @pile2
        elsif pile_name == "pile3"
            @pile3
        end
    end

    def get_user_input
        puts "please enter the disc name and the piles that you want to move from and move to. e.g.'1 pile1 pile2'"
        pos = gets.chomp.split
        pos[0] = pos[0].to_i
        pos
    end

    def move(pos)
        disc, pile_from_name, pile_to_name = pos
        pile_from = get_pile(pile_from_name)
        pile_to = get_pile(pile_to_name)
    
        raise MoveError if disc != pile_from[-1]
        pile_from.pop
        pile_to << disc
    end

    def won?
        pile1 == [] &&  pile2 == [] && pile3 == DISCS
    end

    def print
        pile = [pile1,pile2,pile3]
        p pile
    end

    def play
        while !won?
            begin
                puts "------------------------"
                print
                pos = get_user_input
                move(pos)
            rescue MoveError => m
                puts m.message
                puts "----please try again!----"
                retry
            end
        end
    end
end

h = Hanoi.new
h.play

