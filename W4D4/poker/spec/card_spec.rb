require "card"
describe Card do
    subject(:card){Card.new("Ace","spades")}
    # describe "#initialize"
    it "initializes" do
        expect(card).to be_a(Card)
    end

    it "must have a value" do
        expect(card.value).to eq("Ace")
    end

    it "must have a color" do
        expect(card.color).to eq("spades")
    end

    it "should face down" do
        expect(card.reveal).to eq false
    end

    it "should not be discarded" do
        expect(card.discard).to eq false
    end

    describe "#reveal_card" do
        it "should reveal a card" do
            card.reveal_card
            expect(card.reveal).to eq true
        end
    end 

    describe "#discard_card" do
        it "should discard a card" do
            card.discard_card
            expect(card.discard).to eq true
        end
    end 

end