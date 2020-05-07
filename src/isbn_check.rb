class IsbnCheck
  require_relative './isbn_utils'

  include IsbnUtils
  attr :isbn

  def initialize(number)
    self.isbn = number
  end

  def isbn=(number)
    validate_isbn!(number)

    digit13 = calc13_digit(number)

    @isbn = "#{number}#{digit13}".to_i
  end

  private

  def calc13_digit(number)
    # 1. Take each digit, from left to right and multiply them alternatively by 1 and 3
    arrays_by_index = number_to_indexes_array(number)

    # 2. Sum those numbers
    sum = sum_arrays_nums(arrays_by_index)

    # 3. Take mod 10 of the summed figure
    sum_mod = sum % 10

    # 4. Subtract 10 and if the end number is 10, make it 0
    sum_mod.zero? ? 0 : (10 - sum_mod)
  end

  def validate_isbn!(number)
    raise ArgumentError, 'isbn cannot be negative' if number.is_a?(Numeric) && number.negative?

    raise ArgumentError, 'isbn cannot be string' if number.is_a? String
  end
end
