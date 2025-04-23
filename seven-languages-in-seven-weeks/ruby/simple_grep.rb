# simple_grep.rb <regex_pattern> <file_path>
# regex_pattern = sys.ARGV[0]
# file_path = sys.ARGV[1]

# This could probably be written very concisely in one line.

regex_pattern = ARGV[0]
file_name = ARGV[1]
File.readlines(file_name).each_with_index {|line, index| puts "\e[38;5;118mLine #{index + 1}:\e[0m #{line}" if line =~ /#{regex_pattern}/}
