class IsbnCheck
  attr :isbn

  def initialize(number)
    self.isbn = number
  end

  def isbn=(number)
    validate_isbn!(number)

    @isbn = number
  end

  private

  def validate_isbn!(number)
    raise ArgumentError, 'isbn cannot be negative' if number.is_a?(Numeric) && number.negative?

    raise ArgumentError, 'isbn cannot be string' if number.is_a? String
  end
end
