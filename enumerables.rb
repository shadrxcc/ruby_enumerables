module Enumerable
  def my_each
    for index in self
      yield(index)
    end
  end

  def my_each_with_index
    num = 0
    for words in self
      yield(words, num)
      num += 1
    end
end

  def my_select
    arr = []
    my_each { |num| arr.push(num) if yield(num) }
    arr
  end

  def my_all(arg = nil)
    if block_given?
      my_each { |a| return false unless yield a }
    elsif arg.nil?
      my_each { return false unless a }
    else
      my_each { return false if a != arg }
    end
    true
  end
  end

  def my_any?(arg = nil)
    if block_given?
      my_each { |a| return true if yield(a) }
    elsif arg.nil?
      return true if a
    else
      my_each { |a| return true if a != arg }
    end
    false
  end

  def my_none(arg = nil)
    if block_given?
      my_each { |a| return false if yield(a) }
    elsif arg.nil?
      my_each { |a| return false if a }
    else
      my_each { |a| return false if a != arg }
    end
    true
  end

  def my_count
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
    sum = []
    fig.each do |a|
    if my_proc.nil?
      sum.push(proc.call(a))
    else
      sum.push(yield(num))
    end
    sum
    end
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
    arg
  end

  def multiply_els(arr)
    arr.my_inject { |sum, num| sum * num }
  end
