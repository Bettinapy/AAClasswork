require "hanoi"
describe Hanoi do
    subject(:hanoi1){Hanoi.new}
    describe "move" do
        it "should accept an array of disc num and moving piles" do
            expect{hanoi1.move([1,"pile1","pile2"])}.to_not raise_error
        end

        context "move the disc which is not on the top of the pile" do
            it "should raise an error message" do
                expect{hanoi1.move([2,"pile1","pile2"])}.to raise_error(MoveError)
            end
        end

        context "move the disc which is on the top of the pile" do
            it "should move the disc to the other pile" do
                hanoi1.move([1,"pile1","pile2"])
                expect(hanoi1.pile1).to eq([3,2])
                expect(hanoi1.pile2).to eq([1])
            end
        end

    end

    describe "won?" do
        let(:hanoi2) do 
            hanoi2 = Hanoi.new
            hanoi2.move([1,"pile1","pile3"])
            hanoi2.move([2,"pile1","pile2"])
            hanoi2.move([1,"pile3","pile2"])
            hanoi2.move([3,"pile1","pile3"])
            hanoi2.move([1,"pile2","pile1"])
            hanoi2.move([2,"pile2","pile3"])
            hanoi2.move([1,"pile1","pile3"])
            hanoi2
        end

        it "should move all discs to pile 3" do
            expect(hanoi2.pile1).to eq([])
            expect(hanoi2.pile2).to eq([])
            expect(hanoi2.pile3.length).to eq(3)
        end

        it "should make the discs in correct order" do
            expect(hanoi2.pile3).to eq([3,2,1])
        end

        context "if won" do
            it "should return true" do
                expect(hanoi2.won?).to eq true
            end
        end

        context "if lose" do
            it "should return false" do
                expect(hanoi1.won?).to eq false
            end
        end
    end


end