require 'faker'

require_relative '../src/isbn_utils'

include IsbnUtils

RSpec.describe IsbnUtils do
  context '.to_digits' do
    subject { 978_014_300_723 }

    it 'returns array with digits' do
      expect(to_digits(subject)).to eq([9, 7, 8, 0, 1, 4, 3, 0, 0, 7, 2, 3])
    end
  end

  context '.odd_even_indexes_arrays' do
    let!(:array) { [9, 7, 8, 0, 1, 4, 3, 0, 0, 7, 2, 3] }

    subject { odd_even_indexes_arrays(array) }

    it 'odd_inexes_array has odd numbers' do
      expect(subject[:odd_inexes_array]).to eq([7, 0, 4, 0, 7, 3])
    end

    it 'even_inexes_array has even numbers' do
      expect(subject[:even_inexes_array]).to eq([9, 8, 1, 3, 0, 2])
    end
  end

  context '.sum_arrays_nums' do
    let!(:hash) do
      {
        odd_inexes_array: [7, 0, 4, 0, 7, 3],
        even_inexes_array: [9, 8, 1, 3, 0, 2]
      }
    end

    subject { sum_arrays_nums(hash) }

    it 'sum items properly' do
      expect(subject).to eq(86)
    end
  end
end
