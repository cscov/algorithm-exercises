
class Fixnum
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
    self.each_char.with_index do |chr, idx|
      sum += (chr.ord * idx)
    end
    sum.hash
  end
end

class Hash
  def hash
    sum = 0
    self.each do |key, val|
      sum += key.to_s.ord * val.to_s.ord
    end
    sum.hash
  end
end
