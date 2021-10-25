# frozen_string_literal: true

require 'bank_account'

describe BankAccount do
  before(:each) do
    allow(Date).to receive(:today).and_return('2023-01-10')
    allow(Transaction).to receive(:new).and_return(transaction)
  end
end

describe Deposit do
  it 'takes deposits in pounds and pence to two decimal places' do
    allow(transaction).to receive(:create).and_return({ type: :deposit, date: '10/01/2013', amount: 20.00 })
    expect { subject.deposit(20.00) }.not_to raise_exception
  end
end
