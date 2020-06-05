require "tdd"
describe "#my_uniq" do
    it "should accept an array as an argument" do
        expect{my_uniq([1, 2, 1, 3, 3])}.to_not raise_error
    end

    it "should return an array without duplicates" do
        expect(my_uniq([1, 2, 1, 3, 3])).to eq([1,2,3])
    end

    #should not mutate
end

describe "Array#two_sum" do
    it "returns positions of pairs of numbers that add to zero" do
        expect([1,2,-1].two_sum).to eq([[0,2]])
    end

    it "finds multiple pairs" do
        expect([-1, 0, 2, -2, 1].two_sum).to eq([[0, 4], [2, 3]])
    end

    it "should return the array with correct order" do
        expect([-1,0,1,1].two_sum).to eq([[0,2],[0,3]])
    end

    it "returns [] when no pair is found" do
        expect([2,3,4,5].two_sum). to eq([])
    end
end

describe "#my_transpose" do
    it "should accept an array as an argument" do
        expect{my_transpose([[0, 1, 2],[3, 4, 5],[6, 7, 8]])}.to_not raise_error
    end

    it "should transpose a 3*3 array" do
        expect(my_transpose([[0, 1, 2],[3, 4, 5],[6, 7, 8]])).to eq ([[0, 3, 6],[1, 4, 7],[2, 5, 8]])
    end
    
    it "should transpose a 2*3 array" do
        expect(my_transpose([[0, 1, 2],[3, 4, 5]])).to eq ([[0, 3],[1, 4],[2, 5]])
    end
end

describe "#stock_picker" do
    it "should accept an array of stock prices as an argument" do
        expect{stock_picker([7,1,5,4,6])}.to_not raise_error
    end

    it "should return the array of most profitable pair of days" do
        expect(stock_picker([7,1,5,3,6,4])).to eq([1,4])
    end

    it "should return [] if no pair is profitable" do
        expect(stock_picker([7,6,4,3,1])).to eq([])
    end
end