require "deck"
describe Deck do
    subject(:deck){Deck.new}
    it "initializes" do
        expect(deck).to be_a(Deck)
    end
    
    it "should have 54 cards" do
        expect(deck.cards.length).to eq(54)
    end

    it "should have card instance" do
        expect(deck.cards[0]).to be_a(Card)
    end

    it "should have 13 spades cards" do
        all_cards = deck.cards
        spades = all_cards.select{|card| card.color == "spades"}
        expect(spades.length).to eq(13)
    end

end