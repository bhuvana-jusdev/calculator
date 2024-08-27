class StringCalculator
  def self.add(numbers)
    return 0 if numbers.empty?

    delimiter = ","
    custom_delimiter_match = numbers.match(/^\/\/(.+)\n(.*)$/)

    if custom_delimiter_match
      delimiter = custom_delimiter_match[1]
      numbers = custom_delimiter_match[2]
    end

    numbers = numbers.gsub("\n", delimiter)
    number_list = numbers.split(delimiter).map(&:to_i)

    negatives = number_list.select { |n| n < 0 }

    raise "negative numbers not allowed: #{negatives.join(', ')}" unless negatives.empty?

    number_list.sum
  end
end

# Get input from the user
puts "Enter the string of numbers:"
input = gets.chomp

begin
  result = StringCalculator.add(input)
  puts "The result is: #{result}"
rescue => e
  puts e.message
end
