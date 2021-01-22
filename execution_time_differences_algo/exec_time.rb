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


