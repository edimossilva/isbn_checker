module IsbnUtils
  require_relative './isbn_utils'

  def number_to_indexes_array(number)
    array = to_digits(number)
    odd_even_indexes_arrays(array)
  end

  def to_digits(number)
    number.to_s.split('').map(&:to_i)
  end

  def odd_even_indexes_arrays(array)
    odd_inexes_array = array.select.with_index { |_item, idx| idx.odd? }
    even_inexes_array = array.select.with_index { |_item, idx| idx.even? }

    {
      odd_inexes_array: odd_inexes_array,
      even_inexes_array: even_inexes_array
    }
  end

  def sum_arrays_nums(arrays_hash)
    sum_odd_index = arrays_hash[:odd_inexes_array].reduce(0) { |sum, n| sum + (n * 3) }
    sum_even_index = arrays_hash[:even_inexes_array].reduce(:+)
    sum_odd_index + sum_even_index
  end
end
