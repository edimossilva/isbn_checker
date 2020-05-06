module IsbnUtils
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
end
