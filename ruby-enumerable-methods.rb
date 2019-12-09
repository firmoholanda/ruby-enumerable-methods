# frozen_string_literal: true

module Enumerable
  def my_each
    for item in self do
      yield(item)
    end
  end

end

my_array = ["firmo", "pinheiro", "holanda"]

my_array.my_each { |i| puts i}