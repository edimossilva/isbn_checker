module IsbnUtils
  def to_digits(number)
    number.to_s.split('').map(&:to_i)
  end
end
