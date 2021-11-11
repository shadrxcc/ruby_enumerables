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
      my_each { |a| return false unless yield(a) == true }
    elsif arg.nil?
      my_each { |a| return false if a == false ||a.nil?}
    elsif arg.instance_of?(Class)
      my_each { |a| return false if a.class != arg && a.class.superclass != arg }
    elsif arg.instance_of?(Regexp)
      my_each { |a| return false unless arg.match(a) }
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

  def my_map(&block)
    sum = []
    my_each do |a|
      sum <<
        block.call(a)
    end
    sum
  end

  def my_inject(args = nil)
    sym = to_enum
    item = args.nil? ? sym.next : args

    raise 'no block' unless block_given?

    loop do
      item = yield(item, sym.next)
    end
    item
  end
end

# rubocop:enable Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity

def multiply_els(arr)
  arr.my_inject { |sum, num| sum * num }
end

puts %w[ant bear cat].my_all? { |word| word.length >= 3 } #=> true
puts %w[ant bear cat].my_all? { |word| word.length >= 4 } #=> false
puts %w[ant bear cat].my_all?(/t/)                        #=> false
puts [1, 2i, 3.14].my_all?(Numeric)                       #=> true
puts [nil, true, 99].my_all?                              #=> false
puts [].my_all?   