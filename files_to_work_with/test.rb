class Array
    def my_each
        for index in self
      yield(index)
    end
end
  end
  [1,2,3].my_each do |nums|
    puts nums
  end


  class Array
  def my_each_with_index
    num = 0
      for words in self
        yield(words, num)
        num += 1
  end
end
end
  ["apple", "orange", "banana"].my_each_with_index do |words, idx|
    puts words
  end

  class Array
    def my_select
        sum = []
        my_each do |num|
          if yield(num)
            sum.push(num)
          end
      end
end

even_numbers = []

[1,2,3,4,5,6].my_select do |n|
  if n.even?
    even_numbers << n
  end
end

even_numbers
end

class Array
    def my_all(arg = nil)
        if block_given?
            my_each { |a| return false unless yield a}
            elsif arg.nil?
                my_each { |i| return false unless a}
                 else
          my_each { |i| return false if a != arg }
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

def my_none
    
end