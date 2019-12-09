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
    self.my_each do |item|
      select_arr << item if yield(item)
    end
    select_arr
  end

end

#my_array = ["firmo", "pinheiro", "holanda"]
my_array = [3, 5, 1, 10, 7, 12]

#my_array.my_each { |i| puts i}
#my_array.my_each_with_index { |item, i| puts item + " " + i.to_s}

puts my_array.my_select { |num|  num.even?  }

