module Enumerables
  def my_each
    my_each do |fig|
      yield fig
    end
  end

  def my_each_with_index(figs)
    my_each do |fig|
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
      result = true unless figs[a]
    end
  end

  def my_none(figs)
    result = true
    fig.each do |a|
      result = false unless figs[a]
    end
  end

  def my_count
    sum = 0
    fig.each do |a|
      sum += 1 if figs[a]
    end
  end

  def my_map(figs)
    sum = []
    fig.each do |a|
      sum = figs.call(a)
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

puts [1, 2, 3, 4].select(&:even?)
