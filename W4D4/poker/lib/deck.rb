require_relative "card"

class Deck
    attr_reader :cards
    def set_desk
        colors = ["spades","diamonds","heart","clubs"]
        values = ["Ace","2","3","4","5","6","7","8","9","10","Jack","Queen","King"]
        colors.each do |color|
            values.each do |value|
                cards << Card.new(value,color)
            end
        end
        # jokers
        cards << Card.new("Joker","black")
        cards << Card.new("Joker","red")
    end

    def initialize
        @cards = []
        set_desk
    end
end