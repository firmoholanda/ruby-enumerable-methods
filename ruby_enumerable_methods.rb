# frozen_string_literal: true

# rubocop:disable Style/CaseEquality
module Enumerable
  def my_each
    for item in self do
      yield(item)
    end
  end

  def my_each_with_index
    i = 0
    self.my_each do |item|
      yield(item, i)
      i += 1
    end
  end

  def my_select
    select_arr = []
    self.my_each { |item| select_arr << item if yield(item) }
    select_arr
  end

  def my_all?
    pass = false
    self.my_each do |item|
      pass = yield(item)
      break if not pass
    end
    pass
  end

  def my_any?
    pass = false
    self.my_each do |item|
      pass = yield(item)
      break if pass
    end
    pass
  end

  def my_none?
    pass = false
    self.my_each do |item|
      pass = !yield(item)
      break if not pass
    end
    pass
  end

  def my_count
    self.length
  end

  def my_map(proc = nil, &block)
    new_arr = []
    return self unless proc or block_given?
    self.my_each { |item| block_given? ? new_arr << yield(item) : new_arr << code.call(item) }
    new_arr
  end

  def my_inject(num = nil)
    accumulator = num.nil? ? first : num
    my_each { |i| accumulator = yield(accumulator, i) }
		accumulator
  end

end

def multiply_els(list)
  list.my_inject(1) { |product, item| product * item }
end
# rubocop:enable Style/CaseEquality