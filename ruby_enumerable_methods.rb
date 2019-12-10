# frozen_string_literal: true

module Enumerable
  def my_each
    for item in self do
      yield(item)
    end
  end

  def my_each_with_index
    i = 0
    for item in self do
      yield(item, i)
      i += 1
    end
  end

  def my_select
    select_arr = []
    for item in self do
      select_arr << item if yield(item)
    end
    select_arr
  end

  def my_all?
    pass = false
    for item in self do
      pass = yield(item)
      break unless pass
    end
    pass
  end

  def my_any?
    pass = false
    for item in self do
      pass = yield(item)
      break if pass
    end
    pass
  end

  def my_none?
    pass = false
    for item in self do
      pass = !yield(item)
      break unless pass
    end
    pass
  end

  def my_count
    length
  end

  def my_map(proc = nil)
    new_arr = []
    return self unless proc or block_given?
       for item in self do
      if block_given?
        new_arr << yield(item)
      else
        new_arr << code.call(item)
      end
    end
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
