require "./ruby_enumerable_methods.rb"

RSpec.describe Enumerable do
  let(:my_array) { [3, 5, 1, 10, 7, 12, 33] }

  # my_each --------------------------------------------------------------------------- #
  describe "#my_each" do
    it "returns enumerator if block is not given" do
      expect(my_array.my_each).to be_an Enumerator
    end

    it "returns self if block is given" do
      expect(my_array.my_each { |item| item + 3 }).to eql(my_array)
    end
  end

  # my_each_with_index ---------------------------------------------------------------- #
  describe "#my_each_with_index" do
    it "returns an enumerator if block is not given" do
      expect(my_array.my_each_with_index).to be_an Enumerator
    end

    it "returns self if block is given" do
      expect(my_array.my_each_with_index { |item, i| "item in array #{item}, index #{i}" }).to eql(my_array)
    end
  end

  # my_select ------------------------------------------------------------------------- #
  describe "#my_select" do
    it "returns an enumerator if block is not given" do
      expect(my_array.my_select).to be_an Enumerator
    end

    it "returns elements that yield true if block is given" do
      expect(my_array.my_select { |item| item > 3 }).to eql([5, 10, 7, 12, 33])
    end
  end

  # my_map ---------------------------------------------------------------------------- #
  describe "#my_map" do
    it "returns an enumerator if no argument or block is passed" do
      expect(my_array.my_map).to be_an Enumerator
    end

    it "returns new array with values generaded from the block" do
      expect(my_array.my_map { |item| item * 3 }).to eql([9, 15, 3, 30, 21, 36, 99])
    end

    it "returns new array with values generaded from the proc" do
      expect(my_array.my_map(proc { |item| item * 33 })).to eql([99, 165, 33, 330, 231, 396, 1089])
    end
  end

  # my_inject ------------------------------------------------------------------------- #
  describe "#my_inject" do
    context "when there is no initial value as a parameter" do
      it "combines all the elements by aplying a binary operation specified by a block" do
        expect(my_array.my_inject { |sum, x| sum + x }).to eql(71)
      end

      it "combines all the elements by aplying a named method specified by a symbol" do
        expect(my_array.my_inject(:*)).to eql(415800)
      end
    end

    context "when there is an initial value as a parameter" do
      it "combines all the elements by aplying a binary operation specified by a block" do
        expect(my_array.my_inject(33) { |sum, item| sum + item }).to eql(104)
      end

      it "combines all the elements by aplying a named method specified by a symbol" do
        expect(my_array.my_inject(33, :*)).to eql(13721400)
      end
    end
  end

end
