require_relative '../lib/enumerables'

describe Enumerable do
  let(:arr) { [4, 5, 8, 2, 1, 9, 3, 7, 6] }

  describe '#my_each' do
    it 'should return each value in the array to the block after iteration' do
      expect(arr.my_each { |i| puts i }).to eql([4, 5, 8, 2, 1, 9, 3, 7, 6])
    end
  end

  describe 'my_each_with_index' do
    it 'should return indexes of elements in the array' do
      expect(arr.my_each_with_index { |elem, index| puts "#{index}:#{elem}" }).to eql([4, 5, 8, 2, 1, 9, 3, 7, 6])
    end
  end

  describe '#my_count' do
    it 'return the count of elements that evaluate to true' do
      expect(arr.my_count { |i| i < 4 }).to eq(3)
    end
  end

  describe '#my_select' do
    it 'should return a particular type of element selected' do
      expect(arr.my_select(&:even?)).to eql([4, 8, 2, 6])
    end
  end

  describe '#my_all' do
    it 'should return a boolean value true if all the objects in the enumerable satisfies the given condition' do
      expect(arr.my_all? { |i| i < 4 }).to be false
    end
  end

  describe '#my_any?' do
    it 'should return true if at least one element is true' do
      expect(arr.my_any?(&:even?)).to be true
    end
  end

  describe '#my_none?' do
    it 'should return true if no elements are true' do
      expect(arr.my_none? { |i| i > 10 }).to be true
    end
  end

  describe '#my_map' do
    it 'should return double of the numbers in the array' do
      expect(arr.my_map { |i| i * 2 }).to eql([8, 10, 16, 4, 2, 18, 6, 14, 12])
    end
  end

  describe '#my_inject' do
    it 'returns the sum total of all elements in the array' do
      expect(arr.my_inject { |sum, num| sum + num }).to eql(45)
    end
  end

  describe '#multiply_els' do
    it 'should mutliply and return the elements in the array' do
      expect(arr.my_inject { |sum, num| sum * num }).to eql(362_880)
    end
  end
end
