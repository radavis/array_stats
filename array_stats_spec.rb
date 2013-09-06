require 'rspec'
require_relative 'array_stats'

describe ArrayStatistic do
  it 'returns the largest number in an array' do
    expect(ArrayStatistic.new([1]).largest).to eql(1)
    expect(ArrayStatistic.new([1,2]).largest).to eql(2)
    expect(ArrayStatistic.new([99, 5, 0, 8888, -2, -15]).largest).to eql(8888)
  end

  it 'return the smallest number in an array' do
    expect(ArrayStatistic.new([1]).smallest).to eql(1)
    expect(ArrayStatistic.new([1,2]).smallest).to eql(1)
    expect(ArrayStatistic.new([99, 5, 0, 8888, -2, -15]).smallest).to eql(-15)
  end

  it 'returns the average of an array' do
    expect(ArrayStatistic.new([1]).average).to eql(1.0)
    expect(ArrayStatistic.new([2, 2]).average).to eql(2.0)
    expect(ArrayStatistic.new([2, 4, 6, 8, -3]).average).to eql(3.4)
  end

  it 'returns the standard deviation of each number in an array' do
    expect(ArrayStatistic.new([1]).standard_deviation).to eql(0.0)
    expect(ArrayStatistic.new([2, 2]).standard_deviation).to eql(0.0)
    expect(ArrayStatistic.new([2, 4, 6, 8, -3]).standard_deviation).to eql(3.7735924528226414)
    expect(ArrayStatistic.new([2, 4, 4, 4, 5, 5, 7, 9]).standard_deviation).to eql(2.0)
  end

  it 'return the nth smallest number in an array' do
    expect(ArrayStatistic.new([1]).nth_smallest(1)).to eql(1)
    expect(ArrayStatistic.new([4, 2, 3]).nth_smallest(1)).to eql(2)
    expect(ArrayStatistic.new([2, 4, 6, 8, -3]).nth_smallest(2)).to eql(2)
  end

  it 'return the sum of all the numbers of an array' do
    expect(ArrayStatistic.new([1]).sum).to eql(1)
    expect(ArrayStatistic.new([2, 2]).sum).to eql(4)
    expect(ArrayStatistic.new([2, 4, 6, 8, -3]).sum).to eql(17)
  end

  it 'return the product of all the number of an array' do
    expect(ArrayStatistic.new([1]).product).to eql(1)
    expect(ArrayStatistic.new([2, 2]).product).to eql(4)
    expect(ArrayStatistic.new([2, 4, 6, 8, -3]).product).to eql(-1152)
  end

  it 'return the difference between highest and lowest number in an array' do
    expect(ArrayStatistic.new([1]).high_low_diff).to eql(0)
    expect(ArrayStatistic.new([2, 2]).high_low_diff).to eql(0)
    expect(ArrayStatistic.new([2, 4, 6, 8, -3]).high_low_diff).to eql(11)
  end

  it 'returns the count of n-digit numbers in a hash' do
    expect(ArrayStatistic.new([5]).digit_count).to eql({1 => 1})
    expect(ArrayStatistic.new([11, 5, 10]).digit_count).to eql({1 => 1, 2 => 2})

    expect(
      ArrayStatistic.new([505, 555, 548, 6666, 6778, 6584, 6123, 97845, 94567, 94567, 10])
      .digit_count)
      .to eql({3 => 3, 4 => 4, 5 => 3, 2 => 1})
  end

  # non-core features
  it 'return how many times a number is included in an array' do
    expect(ArrayStatistic.new([10, 20, 40, 10, 10]).frequency).to eql({10 => 3, 20 => 1, 40 => 1})
  end

  it 'return the prime factors of each number in an array' do
    # expect(ArrayStatistic.new([3, 5, 8, 12, 28]).prime_factors).to eql([[3], [5], [2, 2, 2], [2, 2, 3], [2, 2, 7]])
  end
end
