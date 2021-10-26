# frozen_string_literal: true

require_relative 'transaction'
require_relative 'statement'

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
    return 'You have insufficient funds for this withdrawal' if amount > calc_balance

    @transactions << Transaction.new.create(:withdrawal, amount)
    'Your withdrawal has been approved'
  end

  def print_statement
    statement = Statement.new(@transactions)
    statement.print_statement
  end

  private

  attr_reader :transactions

  def calc_balance
    balance = 0
    @transactions.each do |transaction|
      transaction[:type] == :deposit ? balance += transaction[:amount] : balance -= transaction[:amount]
    end
    balance
  end

  def check_validity(amount)
    raise 'Amount should be stated in pounds and pence to two decimal places' unless amount.is_a? Float
    raise 'Amount should be stated in pounds and pence to two decimal places' if amount.round(2) != amount
    raise 'Amount deposited must exceed 0.00' if amount <= 0
  end
end
