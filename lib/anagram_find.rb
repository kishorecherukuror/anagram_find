require "anagram_find/version"

module AnagramFind
  class Error < StandardError; end
    class << self
      def method_missing(m, *args, &block)
          puts "#{m} method Does't exit"
      end
      def anagram(filepath,word)
          words = []
          begin
              File.open(filepath,"r") { |f| f.each_line { |line| words << line.chomp.split(/[\s,-]+/) }}
          rescue
              puts "No such file"
              exit
          end
          anagram = words.flatten.group_by {|w| w.chars.sort }.values.select {|arr| arr.include? word}.flatten
          anagram.empty? ? "No anagram" : anagram
      end
    end
end
