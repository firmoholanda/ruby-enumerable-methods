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

end

my_array = ["firmo", "pinheiro", "holanda"]

#my_array.my_each { |i| puts i}
my_array.my_each_with_index { |item, i| puts item + " " + i.to_s}