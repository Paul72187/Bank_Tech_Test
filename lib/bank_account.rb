# frozen_string_literal: true

require_relative 'transaction'

# Creates a bank account that allows deposits and withdrawals
class BankAccount
  def initialize
    @transactions = []
  end

  def deposit(amount)
    check_validity(amount)
    @transactions << Transaction.new.create(:deposit, amount)
    'Your deposit has been approved'
  end

  def withdrawal(amount)
    check_validity(amount)
    @transactions << Transaction.new.create(:withdrawal, amount)
    'Your withdrawal has been approved'
  end

  private

  attr_reader :transactions

  def check_validity(amount)
    raise 'Amount should be stated in pounds and pence to two decimal places' unless amount.is_a? Float
    raise 'Amount should be stated in pounds and pence to two decimal places' if amount.round(2) != amount
    raise 'Amount deposited must exceed 0.00' if amount <= 0
  end
end
