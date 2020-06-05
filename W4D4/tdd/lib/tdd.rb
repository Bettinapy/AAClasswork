def my_uniq(arr)
    new_arr = []
    arr.each{|ele| new_arr << ele if !new_arr.include?(ele)}
    new_arr
end

class Array
    def two_sum
        new_arr = []
        (0...self.length).each do |i|
            (i+1...self.length).each do |j|
                new_arr << [i,j] if self[i]+self[j] == 0
            end
        end
        new_arr
    end
end

def my_transpose(arr)
    (0...arr[0].length).map do |i|
        arr.map {|a|a[i]}
    end
end

def stock_picker(prices)
    most_profitable = 0
    pair = []
    (0...prices.length).each do |buy|
        (buy+1...prices.length).each do |sell|
            profit = -prices[buy]+prices[sell]
            if profit > most_profitable
                most_profitable = profit 
                pair = [buy,sell]
            end
        end
    end
    pair
end

