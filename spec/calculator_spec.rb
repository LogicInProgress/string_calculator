require_relative '../lib/calculator'

RSpec.describe Calculator, "#add" do
  it "returns 0 for an empty string" do
    expect(Calculator.new("").add).to eq(0)
  end

  it "returns the number itself for a single number" do
    expect(Calculator.new("10").add).to eq(10)
  end

  it "returns the sum of two numbers separated by a comma" do
    expect(Calculator.new("1,2,3,4,5").add).to eq(15)
  end

  it "handles an unknown number of numbers" do
    expect(Calculator.new("10,20,30,40,50").add).to eq(150)
  end

  it "allows new lines as delimiters along with commas" do
    expect(Calculator.new("1\n2\n3").add).to eq(6)
  end

  it "Handles single-character delimiter" do
    expect(Calculator.new("//;\n1;2").add).to eq(3)
    expect(Calculator.new("//|\n3|4|5").add).to eq(12)
  end

  it "raises an exception for negative numbers" do
    expect { Calculator.new("2,-4,-6").add }.to raise_error("negatives not allowed: -4, -6")
  end

  it "ignores numbers greater than 1000" do
    expect(Calculator.new("1,2,1001").add).to eq(3)
  end

  it "supports custom delimiters of any length" do
    expect(Calculator.new("//[***]\n1***2***3").add).to eq(6)
  end

  it "supports multiple delimiters" do
    expect(Calculator.new("//[*][%]\n1*2%3").add).to eq(6)
  end

  it "supports multiple delimiters with different lengths" do
    expect(Calculator.new("//[***][%%]\n1***2%%3").add).to eq(6)
  end
end
