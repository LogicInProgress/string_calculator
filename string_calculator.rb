
class StringCalculator
  attr_reader :number_string

  def initialize(string)
    @number_string = string
  end

  def add
    return 0 if number_string.empty?
    raise RuntimeError if number_string.end_with?("/n")

    delimiter = ","

    if number_string.start_with?("//")
      string_with_delimiter = number_string.split("\n")
      delimiter = string_with_delimiter.first[2]
      string = string_with_delimiter.last
    end

    number_string.gsub!("\n", delimiter)
    numbers = number_string.gsub("\n", delimiter).split(delimiter).map(&:to_i)
    
    negative_numbers = numbers.select { |n| n < 0 }
    if negative_numbers.any?
      raise "negatives not allowed: #{negative_numbers.join(', ')}"
    end
    
    numbers.sum
  end
end
