module Enumerables
  def my_each(figs)
    for fig in figs
      yield fig
    end
  end

  def my_each_with_index(figs)
    for fig in figs
      yield(fig[figs], figs)
    end
  end

  def select
    sum = []
    fig.each do |a|
      sum == a if figs.call(a) == true
    end
    sum
  end

  def my_all
    result = true
    fig.each do |a|
      result = false if yield a
    end
  end

  def my_any(figs)
    result = false
    fig.each do |a|
      if yield figs[a]
        result = true
      end
    end
  end

  def my_none(figs)
    result = true
    fig.each do |a|
    if yield figs[a]
      result = false
    end
    end
  end

  def my_count
    sum = 0
    fig.each do |a|
      if yield figs[a]
        sum += 1
      end
    end
  end

  def my_map(figs)
    sum = []
    fig.each do |a|
      sum = figs.call(a)
    end
    sum
  end

  def my_inject(figs)
    sum = 0
    fig.each do |a|
      if sum.positive?
        sum = my_all
      else
        sum = yield(sum, a)
      end
    end
  end

  def multiply_els(figs)
    figs.my_inject { |sum, a| sum * a }
  end
end

val = [1, 2, 3, 4]
puts val.select ({ |a| a == 1 })
puts val.map ({ |a| a * 5 })
