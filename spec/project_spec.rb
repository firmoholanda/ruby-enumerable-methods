require './ruby_enumerable_methods.rb'

RSpec.describe Enumerable do
  let(:my_array) { [3, 5, 1, 10, 7, 12, 33] }

  # my_each
  describe '#my_each' do
    it 'returns enum if block not given' do
      expect(my_array.my_each).to be_an Enumerator
    end

    it 'returns self if block given' do
      expect(my_array.my_each { |x| x + 1 }).to eql(my_array)
    end
  end

end
