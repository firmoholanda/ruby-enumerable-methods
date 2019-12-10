require './ruby_enumerable_methods.rb'

test_proc = Proc.new {|i| i + 3}

my_array = [3, 5, 1, 10, 7, 12, 33]

# my_array.my_each { |i| puts i}
 my_array.my_each_with_index { |item, i| puts item.to_s + " " + i.to_s }
# puts my_array.my_select { |num| num.even? }
# puts my_array.my_all? { |num| num.even? }
# puts my_array.my_any? { |num| num.even? }
# puts my_array.my_none? { |num| num.even? }
# puts my_array.count
# puts my_array.map { |number| number * 2 } 
# puts my_array.my_inject {|sum, n| sum + n } 
# puts multiply_els(my_array)
# puts (my_array.my_map(&test_proc))