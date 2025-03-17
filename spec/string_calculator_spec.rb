require_relative '../string_calculator'

RSpec.describe StringCalculator, "#add" do
  it "returns 0 for an empty string" do
    expect(StringCalculator.new("").add).to eq(0)
  end

  it "returns the number itself for a single number" do
    expect(StringCalculator.new("10").add).to eq(10)
  end

  it "returns the sum of two numbers separated by a comma" do
    expect(StringCalculator.new("1,2,3,4").add).to eq(10)
  end

  it "handles an unknown number of numbers" do
    expect(StringCalculator.new("10,20,30,40,50").add).to eq(150)
  end

  it "allows new lines as delimiters along with commas" do
    expect(StringCalculator.new("1\n2\n3").add).to eq(6)
  end

  it "Handles single-character delimiter" do
    expect(StringCalculator.new("//;\n1;2").add).to eq(3)
    expect(StringCalculator.new("//|\n3|4|5").add).to eq(12)
  end

  it "raises an exception for negative numbers" do
    expect { StringCalculator.new("2,-4,-6").add }.to raise_error("negatives not allowed: -4, -6")
  end
end
