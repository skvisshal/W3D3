def exp(b, n)
    return 1 if n == 0
    return b if n == 1
    b*exp(b, n-1)
end

def exp2(b, n)
    return 1 if n == 0
    return b if n == 1
    if n%2 == 0
        exp(b, n / 2) ** 2
    else
        b * (exp(b, (n - 1) / 2) ** 2)
    end
end

class Array
    def deep_dup
        return self if self.length == 1
        result = []
        self.each do |ele|
            if ele.is_a?(Array)
                result << ele.deep_dup
            else
                result << ele
            end
        end
        result
    end
end

# robot_parts = [
#   ["nuts", "bolts", "washers"],
#   ["capacitors", "resistors", "inductors"]
# ]

# robot_parts_copy = robot_parts.deep_dup
# # shouldn't modify robot_parts
# robot_parts_copy[1] << "LEDs"
# # but it does
# robot_parts[1] # => ["capacitors", "resistors", "inductors", "LEDs"]
# p robot_parts_copy
# p robot_parts

def fib(n)
    return [0] if n == 1
    return [0,1] if n == 2
    arr = fib(n-1) 
    arr << arr.last(2).sum
end

# p fib(5)

def bsearch(array, num)
    return nil if array.empty?

    mid_index = array.length / 2
    if array[mid_index] == num
        return mid_index
    elsif array[mid_index] > num
        return nil if bsearch(array[0...mid_index], num) == nil
        return bsearch(array[0...mid_index], num)
    else
        return nil if bsearch(array[mid_index+1..-1], num) == nil
        return mid_index + 1 + bsearch(array[mid_index+1..-1], num)
    end
end

# p bsearch([1, 2, 3], 1) # => 0
# p bsearch([2, 3, 4, 5], 3) # => 1
# p bsearch([2, 4, 6, 8, 10], 6) # => 2
# p bsearch([1, 3, 4, 5, 9], 5) # => 3
# p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
# p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
# p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil

def merge_sort(array)
    return nil if array.empty?
    return array if array.length == 1

    mid_index = array.length / 2
    left = array[0...mid_index]
    right = array[mid_index..-1]
    left_sorted = merge_sort(left)
    right_sorted = merge_sort(right)
    p "mi: #{mid_index} left: #{left} right: #{right} left_s #{left_sorted} right_s #{right_sorted}"
    merge(left_sorted, right_sorted)
end

def merge(left_arr, right_arr)
    left_index = 0
    right_index = 0
    sorted = []
    while left_index < left_arr.length && right_index < right_arr.length
        if left_arr[left_index] > right_arr[right_index]
            sorted << right_arr[right_index]
            right_index += 1
        else
            sorted << left_arr[left_index]
            left_index += 1
        end
    end
    if left_index != left_arr.length
        sorted += left_arr[left_index..-1]
    else
        sorted += right_arr[right_index..-1]
    end
    sorted
end
#p merge_sort([9, 7, 6, 3, 8, 3, 2, 1, 9])
#p merge([9],[7])
#9 7 6 3 8 3 2 1

def subsets(array)
    return [[]] if array.empty?
    prev_array = subsets(array[0...-1])
    temp_arr = []
    prev_array.each do |subset|
        temp_arr << subset + [array.last]
    end
    prev_array + temp_arr
end


p subsets([]) # => [[]]
p subsets([1]) # => [[], [1]]
p subsets([1, 2]) # => [[], [1], [2], [1, 2]]
p subsets([1, 2, 3])
# => [[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]]

#[1 2 3 4]