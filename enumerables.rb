# rubocop:enable Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity

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
      my_each { return false unless a }
    elsif arg.instance_of?(Class)
      my_each { return false unless a.class != arg }
    elsif arg.instance_of?(Regexp)
      my_each { return false unless a }
    else
      my_each { return false if a != arg }
    end
    true
  end

  def my_any?(arg = nil)
    if block_given?
      my_each { |a| return true if yield(a) }
    elsif arg.nil?
      return true if a
    elsif arg.instance_of?(Class)
      my_each { |a| return true if a != arg }
    elsif arg.instance_of?(Regexp)
      my_each { |a| return true if a != arg }
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
      my_each { |a| return false if a != arg }
    elsif arg.instance_of?(Regexp)
      my_each { |a| return false if a != arg }
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
      my_each { sum += 1 if a == arg }
    end
    sum
  end

  def my_map(my_proc)
    sum = 0
    num = []
    while sum < length
      if my_proc.nil?
        sum.push(proc.call(a))
      else
        sum.push(yield(self[sum]))
      end
      sum += 1
    end
    my_proc
  end

  def my_inject(arg = nil)
    sum = 0
    while sum < length
      if arg.nil?
        sum += 1
        arg = yield(self[0], self[sum])
        # elsif arg.instance_of?(Range)
        # sum[0...4].my_each |a|
        # arg = yield(arg, self[a]
      else
        arg = yield(arg, self[sum])
      end
      sum += 1
    end
    arg
  end
end

# rubocop:enable Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity

def multiply_els(arr)
  arr.my_inject { |sum, num| sum * num }
end
