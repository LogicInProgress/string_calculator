
def add(string)
  return 0 if string.empty?
  raise RuntimeError if string.end_with?("/n")

  delimiter = ","

  if string.start_with?("//")
    string_with_delimiter = numbers.split("\n")
    delimiter = string_with_delimiter.first[2]
    string = string_with_delimiter.last
  end

  string = string.gsub("\n", delimiter)
  numbers = string.split(delimiter).map(&:to_i)
  
  negative_numbers = numbers.select { |n| n < 0 }
  if negative_numbers.any?
    raise RuntimeError "negatives not allowed: #{negative_numbers.join(', ')}"
  end
  
  numbers.sum
end

