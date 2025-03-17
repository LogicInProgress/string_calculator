class Extract
  # Constants
  DEFAULT_DELIMITER = ","

  attr_reader :string

  def initialize(string)
    @string = string
  end

  def extract
    raise RuntimeError if string.end_with?("/n")

    if string.start_with?("//")
      custom_delimiter_extract
    else
      default_extract
    end
  end

  private

  def default_extract
    numbers = string.gsub("\n", DEFAULT_DELIMITER)
                    .split(DEFAULT_DELIMITER)

    numbers.map(&:to_i)
  end

  def custom_delimiter_extract
    string_with_delimiter = string.split("\n")

    if string.start_with?("//[")
      delimiters = []
      delimiter_section = string_with_delimiter.first.split("//").last
      
      delimiter_section.chars.each do |delimiter|
        next if delimiter == "[" || delimiter == "]"

        delimiters.push(delimiter)
      end

      numbers = []
      string_with_delimiter[1..].join("").chars.each do |string|
        next if delimiters.include?(string) || string == "\n"

        numbers.push(string.to_i)
      end
    else
      delimiter = string_with_delimiter.first[2]
      numbers = string_with_delimiter.last
                                     .gsub("\n", delimiter)
                                     .split(delimiter)
    end

    numbers.map(&:to_i)
  end
end
