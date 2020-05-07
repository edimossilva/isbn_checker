require 'faker'

require_relative '../src/isbn_check'

RSpec.describe IsbnCheck do
  context '#initialize' do
    let!(:companies_quantity) { 33 }
    let!(:random_string) { Faker::String.random(length: 12) }
    let!(:number12_digits_negative) { -Faker::Number.number(digits: 12) }

    context 'When receives a number' do
      context 'When has 12 digits' do
        context 'When is a positive number' do
          context 'When sum_mode is not zero' do
            let!(:isbn_12) { 978_014_300_723 }
            let!(:isbn_13) { 9_780_143_007_234 }

            subject(:subject) { IsbnCheck.new(isbn_12) }

            it 'creates a instance' do
              expect(subject).to be_an(IsbnCheck)
            end
            it 'set @isbn' do
              expect(subject.isbn).to eq(isbn_13)
            end
          end

          context 'When sum_mode is zero' do
            let!(:isbn_12_with_sum_mode_zero) { 978_014_300_718 }
            let!(:isbn_13) { 9_780_143_007_180 }

            subject(:subject) { IsbnCheck.new(isbn_12_with_sum_mode_zero) }

            it 'creates a instance' do
              expect(subject).to be_an(IsbnCheck)
            end
            it 'set @isbn' do
              expect(subject.isbn).to eq(isbn_13)
            end
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
