# acts_as_csv_module.rb
module ActsAsCsv
  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def acts_as_csv
      include InstanceMethods
      include Enumerable
    end
  end

  module InstanceMethods
    attr_accessor :headers
    attr_accessor :csv_contents

    def initialize
      read
    end

    def read
      @csv_contents = []
      filename = self.class.to_s.downcase + '.txt'
      file = File.new(filename)
      @headers = file.gets.chomp.split(', ')
      file.each do |row|
        @csv_contents << row.chomp.split(', ')
      end
    end
  end
end

class RubyCsv # no inheritance, it gets mixed in with include!
  include ActsAsCsv
  acts_as_csv
end

m = RubyCsv.new
puts m.headers.inspect
puts m.csv_contents.inspect
# csv.each { |row| puts "#{row.name}, #{row.age}" }
