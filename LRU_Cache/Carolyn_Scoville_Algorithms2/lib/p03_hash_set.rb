require_relative 'p02_hashing'
require 'byebug'

class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    if self.include?(key)
      return false
    end
    resize! if count == num_buckets

    hashed_key = key.hash
    self[hashed_key] << key
    @count += 1
  end

  def include?(key)
    hashed_key = key.hash
    self[hashed_key].include?(key)
  end

  def remove(key)
    hashed_key = key.hash
    if !self[hashed_key].include?(key)
      return nil
    end
    self[hashed_key].delete(key)
    @count -= 1
  end

  private

  def [](num)
    hashed_num = num.hash
    @store[hashed_num % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    new_num_buckets = num_buckets * 2
    new_store = Array.new(new_num_buckets) { Array.new }
    @store.each do |bucket|
      bucket.each do |el|
        hashed_el = el.hash
        new_store[hashed_el % new_num_buckets] << hashed_el
      end
    end
    @store = new_store
  end
end
