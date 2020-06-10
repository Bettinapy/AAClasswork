class MaxIntSet
  attr_accessor :store
  def initialize(max)
    @store = Array.new(max, false)
  end

  def insert(num)
    if num < 0 || num > store.length  
      raise "Out of bounds"
    end
    if store[num] == false
      store[num] = true
    end
  end

  def remove(num)
    store[num] = false
  end

  def include?(num)
    store[num]
  end

  private

  def is_valid?(num)
  end

  def validate!(num)
  end
end

require "byebug"
class IntSet
  attr_accessor :store
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    if !include?(num)
      self[num] << num # SEE LINE 51
    end
  end

  def remove(num)
    self[num].delete(num) if include?(num)
  end

  def include?(num)
    # debugger
    self[num].include?(num)#HYHAD TO USE SELF ;  DO IS IT NOT IMPLICIT
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count , :store

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)

    if count == num_buckets
      resize!
    end
    
    if !include?(num)
      self[num] << num 
      @count += 1
    end  

  end

  def remove(num)
    if include?(num) 
      self[num].delete(num) 
      @count -= 1
    end
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!  
    new_store = Array.new(num_buckets*2) { Array.new }
    @store.each do |bucket|
      bucket.each do |sub_num|
        new_store[sub_num % (num_buckets * 2)] << sub_num
      end
    end
    @store = new_store

  end
end
