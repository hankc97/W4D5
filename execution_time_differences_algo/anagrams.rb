require "benchmark"
str1 = "bad"
str2 = "dab"
def first_anagram?(string1, string2)
    permutation_arr = permutation(string1)
    permutation_arr.include?(string2)
end
def permutation(string)
    permutation_arr = []
    return string if string.length == 1
    
    string.each_char.with_index do |char, idx|
        current = char
        others = string[0...idx] + string[idx+1..-1]

        others.each_char.with_index do |char, idx2|
            permutation_arr << current + permutation(others) [idx2]
        end
    end
    permutation_arr
end
puts Benchmark.measure {
    p first_anagram?(str1, str2)
}
