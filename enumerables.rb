# rubocop:disable Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity

module Enumerable
  def my_each(&block)
    each(&block)
  end

  def my_each_with_index
    num = 0
    each do |words|
      yield(words, num)
      num += 1
    end
  end

  def my_select
    arr = []
    my_each { |num| arr.push(num) if yield(num) }
    arr
  end

  def my_all?(arg = nil)
    if block_given?
      my_each { |a| return false unless yield a }
    elsif arg.nil?
      my_each { |a| return false if a }
    elsif arg.instance_of?(Class)
      my_each { |a| return false if a.class != arg && a.class.superclass != arg }
    elsif arg.instance_of?(Regexp)
      my_each { |a| return false unless a }
    else
      my_each { |a| return false if a != arg }
    end
    true
  end

  def my_any?(arg = nil)
    if block_given?
      my_each { |a| return true if yield(a) }
    elsif arg.nil?
      my_each { |a| return true if a }
    elsif arg.instance_of?(Class)
      my_each { |a| return true if a.class != arg && a.class.superclass != arg }
    elsif arg.instance_of?(Regexp)
      my_each { |a| return true if a =~ arg }
    else
      my_each { |a| return true if a != arg }
    end
    false
  end

  def my_none?(arg = nil)
    if block_given?
      my_each { |a| return false if yield(a) }
    elsif arg.nil?
      my_each { |a| return false if a }
    elsif arg.instance_of?(Class)
      my_each { |a| return false if a.class != arg }
    elsif arg.instance_of?(Regexp)
      my_each { |a| return false if a =~ arg }
    else
      my_each { |a| return false if a != arg }
    end
    true
  end

  def my_count(arg = nil)
    sum = 0
    if block_given?
      my_each { |a| sum += 1 if yield(a) }
    elsif arg.nil?
      my_each { sum += 1 }
    else
      my_each { |a| sum += 1 if a == arg }
    end
    sum
  end

  def my_map(proc = nil)
    sum = 0
    num = []
    while sum < length
      if proc.nil?
        num.push(yield(self[sum]))
      else
        num.push(proc.call(self[sum]))
      end
      sum += 1
    end
    [0..-1].my_each do |a|
      num = yield(sum, a)
    end
    num
  end

  def my_inject(arg = nil)
    sum = 0
    while sum < length
      if arg.nil?
        sum += 1
        arg = yield(self[0], self[sum])
      else
        arg = yield(arg, self[sum])
      end
      sum += 1
    end
    [0..-1].my_each do |a|
      arg = yield(sum, a)
    end
    arg
  end
end

# rubocop:enable Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity

def multiply_els(arr)
  arr.my_inject { |sum, num| sum * num }
end
# Tests:
arr = [1, 3, 5, 9, 7]

# my_each
arr.my_each { |element| puts element }

# my_each_with_index
arr.my_each_with_index { |element, index| puts "#{index} -> #{element}" }

# my_select
puts(arr.my_select { |element| element > 5 })

# my_all?
puts(arr.my_all? { |element| element < 10 })

# my_any?
puts(arr.my_any? { |element| element == 1 })

# my_none?
puts(arr.my_none? { |element| element == 10 })

# my_count
puts(arr.my_count { |element| element == 9 })
puts arr.my_count

# my_inject
puts(arr.my_inject { |sum, element| sum + element })

# multiply_els([2,4,5])

# my_map (proc)
proc = proc { |element| element * 10 }
puts arr.my_map(proc)

# my_map (block)
puts(arr.my_map { |element| element * 10 })
