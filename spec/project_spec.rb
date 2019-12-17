require './ruby_enumerable_methods.rb'

RSpec.describe Enumerable do
  let(:my_array) { [3, 5, 1, 10, 7, 12, 33] }

  # my_each
  describe '#my_each' do
    it "returns enumerator if block not is given" do
      expect(my_array.my_each).to be_an Enumerator
    end

    it "returns self if block is given" do
      expect(my_array.my_each { |x| x + 3 }).to eql(my_array)
    end
  end

  # my_each_with_index
  describe '#my_each_with_index' do
    it "returns an enumerator if block not is given" do
      expect(my_array.my_each_with_index).to be_an Enumerator
    end

    it "returns self if block is given" do
      expect(my_array.my_each_with_index { |item, i| "item in array #{item}, index #{i}" }).to eql(my_array)
    end
  end

end
