module Enumerables
  def my_each
    num = 0
    while num > fig.length
      (num - 1).times do |a|
        yield(figs[a])
        num += 1
    end
    figs
  end

  def my_each_with_index(figs)
    num = 0
    unless num > fig.length
      (num - 1).times do |a|
        yield(figs[a], a)
        num += 1
    end
    figs
  end

  def my_select
    sum = []
    fig.each do |num|
      if yield(num)
        sum.push(num)
      end
  end

  def my_all
    fig.each do |num|
      unless yield(num) = false
        return false
      end
      true
  end

  def my_any(figs)
    fig.each do |num|
      if yield(num) = true
        return true
      end
      false
  end

  def my_none(figs)
    fig.each do |num|
      unless yield(num) = false
      return false
      end
      true
  end

  def my_count
    sum = 0
    fig.each do |num|
      if yield(num)
        sum += 1
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

  def my_inject
    sum = 0
    fig.each do |a|
      sum = my_all unless sum.positive
      yield(sum, a)
    end
  end

  def multiply_els(figs)
    figs.my_inject { |sum, a| sum * a }
  end
end

puts [1, 2, 3, 4].select(&:even?)

# This modudle impliments custom enumerable methods
module Enumerable
  # my each
  def my_each
    count = 0
    while count < length
      yield(self[count])
      count += 1
    end
    self
  end

  # my_each_with_each
  def my_each_with_index
    count = 0
    while count < length
      yield(self[count], count)
      count += 1
    end
    self
  end

  # my_select
  def my_select
    arr = []
    my_each { |num| arr.push(num) if yield(num) }
    arr
  end

  # my_all
  def my_all?
    my_each { |num| return false unless yield(num) }
    true
  end

  # my_any?
  def my_any?
    my_each { |num| return true if yield(num) }
    false
  end

  # my_none?
  def my_none?
    my_each { |num| return false if yield(num) }
    true
  end

  # my_count
  def my_count(arg = nil)
    count = 0
    if arg.nil?
      if block_given?
        my_each { |num| count += 1 if yield(num) }
      else
        my_each { count += 1 }
      end
    else
      my_each { |num| count += 1 if arg == num }
    end
    count
  end

  # my_map
  def my_map(proc = nil)
    count = 0
    map_arr = []
    while count < length
      if !proc.nil?
        map_arr.push(proc.call(self[count]))
      else
        map_arr.push(yield(self[count]))
      end
      count += 1
    end
    map_arr
  end

  # my_inject
  def my_inject(initial = nil)
    count = 0
    while count < length
      if initial.nil?
        count += 1
        initial = yield(self[0], self[count])
      else
        initial = yield(initial, self[count])
      end
      count += 1
    end
    initial
  end
end

# multiply_els method -> multiply_els([2,4,5]) #=> 40
def multiply_els(array)
  array.my_inject { |total, item| total * item }
end