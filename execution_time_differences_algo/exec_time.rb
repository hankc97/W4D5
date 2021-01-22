require 'benchmark'
require 'byebug'

list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# space complexity = n ^ 2
def my_min(list)
    result = 0
    list.each do |i|
        result = i if list.all? {|ele| i <= ele}
    end
    result
end

puts Benchmark.measure {
    p my_min(list)
}
# space complexity = n 
def my_min2(list)
    min = 0
    list.each do |ele|
        min = ele if min >= ele
    end
    min
end

puts Benchmark.measure {
    p my_min2(list)
}
list1 = [5, 3, -7]
def largest_con_sums(list)
    sub_arrs = []
    list.each_index do |idx1|
        list.each_index do |idx2|
            sub_arrs << list[idx1..idx2]
        end
    end
    (sub_arrs.map {|arr| arr.sum }).max
end
puts Benchmark.measure {
    p largest_con_sums(list1)
}
list2 = [5, 3, -7]
def largest_con_sums2(list)
    largest_sum = 0
    current_sum = 0
    list.each do |ele|
        current_sum += ele
        if largest_sum < current_sum
            largest_sum = current_sum
        end
    end
    largest_sum
end
puts Benchmark.measure {
    p largest_con_sums2(list2)
}

