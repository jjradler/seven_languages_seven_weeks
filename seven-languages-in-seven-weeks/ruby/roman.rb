# roman.rb
class Roman
  def self.method_missing name, *args
    roman = name.to_s
    # change the edge-case values to something easier to count
    roman.gsub!("IV", "IIII")
    roman.gsub!("IX", "VIIII")
    roman.gsub!("XL", "XXXX")
    roman.gsub!("XC", "LXXXX")
    # now perform the symbol counts.
    (roman.count("I") +
      roman.count("V") * 5 +
      roman.count("X") * 10 +
      roman.count("L") * 50 +
      roman.count("C") * 100)
  end
end

# Now testing it out:
puts Roman.X
puts Roman.XC
puts Roman.XII
puts Roman.IV
puts Roman.IX
