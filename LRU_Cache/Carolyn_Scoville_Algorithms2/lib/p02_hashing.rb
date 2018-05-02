class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    to_hash = self.map.with_index { |e, idx|  e * idx }
    to_hash = to_hash.reduce(&:+)
    to_hash.hash
  end
end

class String
  def hash
    sum = 0
    to_hash = self.each_char.with_index do |chr, idx|
      sum += (chr.ord * idx)
    end
    sum.hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    0
  end
end
