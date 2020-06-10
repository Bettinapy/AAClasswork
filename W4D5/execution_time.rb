def my_min(list)
    list.inject do |acc,ele|
        if acc < ele
            acc
        else
            ele
        end
    end
end

# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min(list)  # =>  -5

## phase I (O(n^3))
# def largest_contiguous_subsum(list)
#     arr = []
#     (0...list.length).each do |start|
#         (start...list.length).each do |ends|
#             arr << list[start..ends]
#         end
#     end
#     largest = arr[0].sum
#     # the arr includes all the subarrays
#     arr.each {|sub_arr| largest = sub_arr.sum if sub_arr.sum > largest}
#     largest
# end
require "byebug"
## phase II 
def largest_contiguous_subsum(list)
    largest_sum = list.first
    current_sum = 0
    i = 0
    j = 0 
    while i < list.length    
        current_sum += list[j]
        if current_sum > largest_sum
            largest_sum = current_sum
        end
        if j == list.length - 1
            i += 1
            j = i  
            current_sum = 0
            next
        end 
        j += 1
    end
    largest_sum
end

list = [5, 3, -7, 8, 10, 2]
sum = num1 + num2
i = 0
j = 0

p largest_contiguous_subsum(list) # => 8
    # possible sub-sums
    # [5]           # => 5
    # [5, 3]        # => 8 --> we want this one
    # [5, 3, -7]    # => 1
    # [3]           # => 3
    # [3, -7]       # => -4
    # [-7]          # => -7
list = [2, 3, -6, 7, -6, 7]
p largest_contiguous_subsum(list) # => 8 (from [7, -6, 7])
list = [-5, -1, -3]
p largest_contiguous_subsum(list) # => -1 (from [-1])