require_relative "./extract"

class Calculator
  attr_reader :numbers

  def initialize(string)
    @string = string

    # Initialize extracter class for numbers and delimiter
    @extract_numbers = Extract.new(string)
  end

  def add
    return 0 if @string.empty?

    # Extract Numbers
    @numbers = @extract_numbers.extract

    # Validate
    validate_numbers

    calculate
  end

  private

  def validate_numbers
    negative_numbers = numbers.select { |n| n < 0 }

    raise "negatives not allowed: #{negative_numbers.join(', ')}" if negative_numbers.any?
  end

  def calculate
    sum = 0

    numbers.each do |number|
      next if number.to_i > 1000

      sum += number
    end

    sum
  end
end
