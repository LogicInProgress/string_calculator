require_relative '../lib/extract'

RSpec.describe Extract, "#add" do
  it "handle numbers separated by a commas" do
    expect(Extract.new("1,2,3,4,5").extract).to eq([1, 2, 3, 4, 5])
  end

  it "handles numbers separated by newline and commas" do
    expect(Extract.new("1,2\n3,4,5").extract).to eq([1, 2, 3, 4, 5])
  end

  it "handles single-character delimiter" do
    expect(Extract.new("//|\n3|4|5").extract).to eq([3, 4, 5])
  end

  it "handles custom delimiters of any length" do
    expect(Extract.new("//[***]\n1***2***3").extract).to eq([1, 2, 3])
  end

  it "handles custom multiple delimiters" do
    expect(Extract.new("//[*][%]\n1*2%3").extract).to eq([1, 2, 3])
  end

  it "handles custom multiple delimiters with different lengths" do
    expect(Extract.new("//[***][%%]\n1***2%\n%3").extract).to eq([1, 2, 3])
  end
end
