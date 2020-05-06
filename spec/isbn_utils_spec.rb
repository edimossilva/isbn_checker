require 'faker'

require_relative '../src/isbn_utils'

include IsbnUtils

RSpec.describe IsbnUtils do
  context '.to_digits' do
    subject { 123_456_789_012 }

    it 'returns array with digits' do
      expect(to_digits(subject)).to eq([1, 2, 3, 4, 5, 6, 7, 8, 9, 0, 1, 2])
    end
  end

  context '.odd_even_indexes_arrays' do
    let!(:array) { [1, 2, 3, 4, 5, 6, 7, 8, 9, 0, 1, 2] }

    subject { odd_even_indexes_arrays(array) }

    it 'odd_inexes_array has odd numbers' do
      expect(subject[:odd_inexes_array]).to eq([2, 4, 6, 8, 0, 2])
    end

    it 'even_inexes_array has even numbers' do
      expect(subject[:even_inexes_array]).to eq([1, 3, 5, 7, 9, 1])
    end
  end
end
