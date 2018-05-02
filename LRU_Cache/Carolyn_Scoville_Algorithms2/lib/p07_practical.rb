require_relative 'p05_hash_map'
# count
def can_string_be_palindrome?(string)
  map_hash = HashMap.new(string.length)
  string.each_char.with_index { |chr, idx| map_hash.set(idx, chr) }
end
