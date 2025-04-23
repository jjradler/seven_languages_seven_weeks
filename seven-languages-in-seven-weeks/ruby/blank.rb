# ruby/blank.rb
class NilClass
  def blank?
    true
  end
end

class String
  def blank?
    self.size == 0
  end
end

# I decided I liked the one-liner version better than the do ... end version.
["", "person", nil].each {|element| puts element unless element.blank?}
