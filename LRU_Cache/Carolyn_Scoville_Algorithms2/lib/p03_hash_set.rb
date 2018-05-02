require_relative 'p02_hashing'

class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    resize! if count == num_buckets
    
    hashed_key = key.hash
    self[key] << hashed_key unless self.include?(hashed_key)
    @count += 1
  end

  def include?(key)
    hashed_key = key.hash
    self[key].include?(hashed_key)
  end

  def remove(key)
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
  end
end
