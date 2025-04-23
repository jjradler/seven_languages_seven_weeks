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
      @headers = to_array(file.gets)

      file.each do |row|
        @csv_contents << CsvRow.new(@headers, to_array(row))
      end
    end

    def to_array(row)
      row.chomp.split(', ')
    end

    def each(&block)
      # note the trick of using yield here!
      @csv_contents.each { |row| yield row }
    end

    class CsvRow
      def initialize(headers, row_array)
        @headers = headers
        @row_data = row_array
      end

      def method_missing name, *args
        index = @headers.find_index(name.to_s)
        # puts "Row header index #{index}"
        @row_data[index]
      end
    end
  end
end

class RubyCsv # no inheritance, it gets mixed in with include!
  include ActsAsCsv
  acts_as_csv
end


# now let's run some tests.
csv= RubyCsv.new
puts "Column One:"
csv.each { |row| puts row.one }
puts "Column Two:"
csv.each { |row| puts row.two }
puts "Success!"
