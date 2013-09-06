require 'prime'

class ArrayStatistic
  def initialize(array)
    @array = array
  end

  def largest
    @array.sort.last
  end

  def smallest
    @array.sort.first
  end

  def average
    # if @array.first == 1
    #   1
    # elsif @array.first == 2
    #   2
    # end

    # sum = 0
    # @array.each do |element|
    #   sum = sum + element
    # end

    # sum.to_f / @array.length

    sum / @array.length.to_f
  end

  def sum
    @array.inject(0) { |total, element| total + element }
  end

  def product
    @array.inject(1) {|total, element| total * element}
  end

  def high_low_diff
    largest - smallest
  end

  def nth_smallest(n)
    @array.sort[n - 1]
  end

  def standard_deviation
    Math::sqrt(@array.inject(0) { |total, element| total + (element - average) ** 2 } / @array.length)
  end

  def digit_count
    result = {}
    @array.each do |number|
      digits = number.to_s.length
      if result[digits].nil?
        result[digits] = 1
      else
        result[digits] += 1
      end
    end
    result
  end

  def frequency
    # found example of this at: http://stackoverflow.com/a/412177
    @array.inject(Hash.new(0)) { |hash, element| hash[element] += 1; hash }
  end

  def prime_factors
    @array.map { |number| number.prime_division.flatten }
  end
end




