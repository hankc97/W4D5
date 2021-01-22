require "benchmark"
str1 = "badd"
str2 = "dab"
# time complexity : n!
# space complexity : n!
def first_anagram?(string1, string2)
    permutation_arr = permutation(string1)
    permutation_arr.include?(string2)
end

def permutation(string)
    permutation_arr = []
    return string if string.length == 1
    
    string.each_char.with_index do |char, idx|
        current = char #[b], [a], [d]
        others = string[0...idx] + string[idx+1..-1]

        others.each_char.with_index do |char, idx2|
            permutation_arr << current + permutation(others)[idx2] #[[ ], [ ]]
        end
    end
    permutation_arr
end

# p ["b","a", "d", "d"].permutation.to_a.length

puts Benchmark.measure {
    p first_anagram?(str1, str2)
}
# time complexity : O(n^2)
# space complexity : O(n)
def second_anagram?(str1, str2)
    s_array = str2.split('')
    str1.each_char.with_index do |char, idx1|
        if s_array.include?(char)
            idx2 = s_array.index(char)
            s_array = s_array[0...idx2] + s_array[idx2 + 1..-1]
        end
    end
    s_array.empty?
end

puts Benchmark.measure {
    p second_anagram?(str1, str2)
}
# time complexity : o(nlogn)
# space complexity : o(n)
def third_anagram?(str1, str2)
    arr1 = str1.split('').sort
    arr2 = str2.split('').sort

    arr1==arr2
end

puts Benchmark.measure {
    p third_anagram?(str1, str2)
}

# time complexity : O(n)
# space complexity : O(n)

def fourth_anagram?(str1, str2)
    s_hash = Hash.new(0)
    str1.each_char {|char| s_hash[char] += 1}
    str2.each_char {|char| s_hash[char] -= 1}

    s_hash.values.all? {|value| value == 0}
end

puts Benchmark.measure {
    p fourth_anagram?(str1, str2)
}

