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