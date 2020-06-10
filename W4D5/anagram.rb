## Phase I: O(n!)
def first_anagram?(str_1, str_2)
    words = str_1.split("")
    arr = words.permutation.to_a.map!{|word| word.join("")}
    arr.include?(str_2)
end
def f(n)
    return 1 if n == 1
    # 2 ^ n
    f(n-2) + f(n-1) 
    # n
    n * f(n-1)             
end

f(1) = 1         base case 
f(2) = 2 * f(1)  
f(3) = 3 * f(2)

# p first_anagram?("tac", "cat")
# p first_anagram?("rubyisasextremelyhard", "isasrubyhardextremely")

## Phase II: O(n^2)
require "byebug"
def second_anagram?(str_1, str_2)

    word = str_2.split("")
    str_1.each_char do |char|
        # find_index & delete: O(n)
        if word.find_index(char) != nil
            idx = word.find_index(char)
            word.delete(word[idx])
        else
            return false
        end
    end
    word.empty?
end

#p second_anagram?("tac", "cat")
#p second_anagram?("rubyishad", "hardisuby")

## Phase III quicksort, worstcase O(n^2), averagecase O(nlogn)

def third_anagram?(str_1,str_2)
    str_1.split("").sort == str_1.split("").sort
end

# p third_anagram?("tac", "cat")
#p third_anagram?("rubyisasextremelyhardidontagreewhatdoyouthinkgetitoksolong", "isasrubyhardextremelyagreedontithinkwhatyoudookgetitlongso")


## Phase IV O(n)

def fourth_anagram?(str_1,str_2)
    # constant. it's not relevant to the input
    hash = Hash.new(0)
    str_1.each_char {|char| hash[char] += 1}
    str_2.each_char {|char| hash[char] -= 1}
    # the size of the hash is constant, not relevant to the input size
    hash.all? {|k,v| v == 0}
end

# p fourth_anagram?("tac", "cat")
p fourth_anagram?("rubyisasextremelyhardidontagreewhatdoyouthinkgetitoksolong", "isasrubyhardextremelyagreedontithinkwhatyoudookgetitlongso")