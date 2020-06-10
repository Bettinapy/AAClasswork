def two_sum?(arr, target_sum)
    hash = Hash.new
    # arr.each_with_index {|num,idx| hash[num] = idx} #O(n)
    arr.each_with_index do |num,idx|
        subtract = target_sum - num
        hash[num] = idx
        if hash[subtract]
            return true
        end
    end
    false
    # hash.each do |k,v| #O(n)
    #     subtract = target_sum - k
    #     if hash[subtract]
    #         return true if hash[subtract] != v
    #     end
    # end
    # false
end
# def two_sum?(arr, target_sum)
#     hash = Hash.new
#     arr.each_with_index {|num,idx| hash[idx] = num} #O(n)
#     hash.each do |idx,num| #O(n)
#         subtract = target_sum - num
#         if hash[idx] == subtract
#             return true if hash[subtract] != v
#         end
#     end
#     false
# end

arr = [0, 12, 13, 100, 202, 103, 1, 5, 5, 7, 11]
p two_sum?(arr, 6) # => should be true
p two_sum?(arr, 10) # => should be false

# def two_sum?(arr,target)
#   hash = Hash.new
#   arr.each_with_index do |num,idx|
#     subtract = target - num
#     hash[num] = idx
#     return true if hash[subtract]
#   end
#   false
# end

## O(n^2)
def bad_two_sums?(arr, target_sum)
    (0...arr.length).each do |start|
        (start+1...arr.length).each do |ends|
            return true if arr[start]+arr[ends] == target_sum
        end
    end
    false
end

# arr = [0, 12, 13, 100, 202, 103, 1, 5, 7, 11]
# p bad_two_sums?(arr, 6) # => should be true
# p bad_two_sums?(arr, 10) # => should be false

## O(n^2) quicksort worstcase, average O(nlogn)
def okay_two_sum?(arr, target_sum)
    arr.sort!
    i = 0
    while i < arr.length - 1
        return true if arr[i] + arr[i+1]  == target_sum
        i += 1
    end
    false
end

# arr = [0, 12, 13, 100, 202, 103, 1, 5, 7, 11]
# p okay_two_sum?(arr, 6) # => should be true
# p okay_two_sum?(arr, 10) # => should be false
