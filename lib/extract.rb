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

    delimiter = string_with_delimiter.first[2]
    numbers = string_with_delimiter.last
                                   .gsub("\n", delimiter)
                                   .split(delimiter)

    numbers.map(&:to_i)
  end
end
