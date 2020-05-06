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
end
