class Card
    attr_reader :value, :color, :reveal, :discard
    def initialize(value,color)
        @value = value
        @color = color
        @reveal = false
        @discard = false
    end

    def reveal_card
        @reveal = true
    end

    def discard_card
        @discard = true
    end

end