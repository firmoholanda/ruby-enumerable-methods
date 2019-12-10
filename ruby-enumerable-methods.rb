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
    self.my_each { |item| select_arr << item if yield(item) }
    select_arr
  end

  def my_all?
    passing = false
    self.my_each do |item| 
      passing = yield(item)
      break if not passing
    end
    passing
  end

  def my_any?
    passing = false
    self.my_each do |item| 
      passing = yield(item)
      break if passing
    end
    passing
  end

  def my_none?
    passing = false
    self.my_each do |item| 
      passing = !yield(item)
      break if not passing
    end
    passing
  end

  def my_count
    self.length
  end

  def my_map(code = nil)
    arr = []
    return self unless code or block_given?
    self.my_each { |item| block_given? ? arr << yield(item) : arr << code.call(item) }
    arr
  end

end

#my_array = ["firmo", "pinheiro", "holanda"]
my_array = [3, 5, 1, 10, 7, 12, 33]

#my_array.my_each { |i| puts i}
#my_array.my_each_with_index { |item, i| puts item + " " + i.to_s}
#puts my_array.my_select { |num| num.even? }
#puts my_array.my_none? { |num| num.even? }
#puts my_array.count

puts my_array.my_map { |num| num * 3 }

