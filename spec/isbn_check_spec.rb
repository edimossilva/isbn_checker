require 'faker'

require_relative '../src/isbn_check'

RSpec.describe IsbnCheck do
  context '#initialize' do
    let!(:companies_quantity) { 33 }
    let!(:number12_digits) { Faker::Number.number(digits: 12) }
    let!(:random_string) { Faker::String.random(length: 12) }

    let!(:number12_digits_negative) { -number12_digits }

    context 'When receives a number' do
      context 'When has 12 digits' do
        context 'When is a positive number' do
          subject(:subject) { IsbnCheck.new(number12_digits) }

          it 'creates a instance' do
            expect(subject).to be_an(IsbnCheck)
          end
          it 'set @isbn' do
            expect(subject.isbn).to eq(number12_digits)
          end
        end

        context 'When is a negative number' do
          subject(:subject) {}

          it "raise error: 'isbn cannot be negative'" do
            expect { IsbnCheck.new(number12_digits_negative) }.to raise_error(ArgumentError, 'isbn cannot be negative')
          end
        end
      end
    end

    context 'When receives a string' do
      it "raise error: 'isbn cannot be string'" do
        expect { IsbnCheck.new(random_string) }.to raise_error(ArgumentError, 'isbn cannot be string')
      end
    end
  end
end
