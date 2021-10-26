# frozen_string_literal: true

require 'bank_account'

describe BankAccount do
  before(:each) do
    allow(Date).to receive(:today).and_return('2023-01-10')
  end

  context 'several deposits and withdrawals' do
    it 'correctly prints statement' do
      2.times do
        subject.deposit(1000.00)
        subject.withdrawal(40.38)
        subject.deposit(250.50)
        subject.withdrawal(2500.00)
      end
      expect { subject.print_statement }.to output(
        "date || credit || debit || balance\n"\
        "10/01/2023 || 250.50 || || 2420.24\n"\
        "10/01/2023 || || 40.38 || 2169.74\n"\
        "10/01/2023 || 1000.00 || || 2210.12\n"\
        "10/01/2023 || 250.50 || || 1210.12\n"\
        "10/01/2023 || || 40.38 || 959.62\n"\
        "10/01/2023 || 1000.00 || || 1000.00\n"
      ).to_stdout
    end
  end
end
