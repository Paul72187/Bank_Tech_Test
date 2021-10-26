# frozen_string_literal: true

require 'statement'

describe Statement do
  let(:statement_no_transactions) { described_class.new([]) }
  let(:statement_with_transactions) do
    described_class.new(
      [{ type: :deposit, date: '10/01/2023', amount: 100.00 },
       { type: :withdrawal, date: '14/01/2023', amount: 10.00 }]
    )
  end

  it 'responds to print_statment with no arguments' do
    expect(statement_no_transactions).to respond_to(:print_statement).with(0).arguments
  end

  describe '.print_statement' do
    it 'prints column headers' do
      expect { statement_no_transactions.print_statement }.to output(
        "date || credit || debit || balance\n"
      ).to_stdout
    end

    it 'prints transaction date' do
      expect { statement_with_transactions.print_statement }.to output(include('10/01/2023')).to_stdout
    end

    it 'prints deposits in the second column and prints empty third column' do
      expect { statement_with_transactions.print_statement }.to output(include('|| 100.00 || ||')).to_stdout
    end

    it 'prints withdrawals in the third column and prints second column' do
      expect { statement_with_transactions.print_statement }.to output(include('|| || 10.00 ||')).to_stdout
    end

    it 'prints account balance following each transaction' do
      expect { statement_with_transactions.print_statement }.to output(include('90.00')).to_stdout
    end

    it 'prints transactions in reverse chronological order' do
      expect { statement_with_transactions.print_statement }.to output(
        "date || credit || debit || balance\n"\
        "14/01/2023 || || 10.00 || 90.00\n10/01/2023 || 100.00 || || 100.00\n"
      ).to_stdout
    end
  end
end
