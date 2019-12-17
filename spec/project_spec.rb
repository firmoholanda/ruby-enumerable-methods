require "./ruby_enumerable_methods.rb"

RSpec.describe Enumerable do
  let(:my_array) { [3, 5, 1, 10, 7, 12, 33] }

  # my_each
  describe "#my_each" do
    it "returns enumerator if block is not given" do
      expect(my_array.my_each).to be_an Enumerator
    end

    it "returns self if block is given" do
      expect(my_array.my_each { |x| x + 3 }).to eql(my_array)
    end
  end

  # my_each_with_index
  describe "#my_each_with_index" do
    it "returns an enumerator if block is not given" do
      expect(my_array.my_each_with_index).to be_an Enumerator
    end

    it "returns self if block is given" do
      expect(my_array.my_each_with_index { |item, i| "item in array #{item}, index #{i}" }).to eql(my_array)
    end
  end

  # my_select
  describe "#my_select" do
    it "returns an enumerator if block is not given" do
      expect(my_array.my_select).to be_an Enumerator
    end

    it "returns elements that yield true if block is given" do
      expect(my_array.my_select { |item| item > 3 }).to eql([5, 10, 7, 12, 33])
    end
  end

  #my_all?
  describe "#my_all?" do
    it "returns true if none of the collection members are false or nil and no block is given" do
      expect(my_array.my_all?).to eql(true)
    end

    it "returns true if all of the collection members are Numeric" do
      expect(my_array.my_all?(Numeric)).to eql(true)
    end
  end

  #my_any?
  describe "#my_any?" do
    it "returns true if at least one of the collection members are not false or nil and no block is given" do
      expect(my_array.my_any?).to eql(true)
    end

    it "returns true if at least one of the collection members are Integer" do
      expect(my_array.my_any?(Integer)).to eql(true)
    end
  end

  #my_none?
  describe "#my_none?" do
    it "returns true if none of the collection members is true and no block is given" do
      expect(my_array.my_none?).to eql(false)
    end

    it "returns true if none of the collection members are minor than 20" do
      expect(my_array.my_none? { |x| x > 43}).to eql(true)
    end
  end

  #my_count
  describe "#my_count" do
    it "returns the number of items in enum through enumeration if no block is given" do
      expect(my_array.my_count).to eql(7)
    end

    it "It counts the number of elements yielding a true value" do
      expect(my_array.my_count { |x| x == 43}).to eql(0)
    end
  end

end
