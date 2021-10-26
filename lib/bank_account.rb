# frozen_string_literal: true

require_relative 'transaction'

# Creates a bank account that allows deposits and withdrawals
class BankAccount
  def initialize
    @transactions = []
  end

  def deposit(amount)
    @transactions << Transaction.new.create(:deposit, amount)
  end

  def withdrawal(amount)
    @transactions << Transaction.new.create(:withdrawal, amount)
  end
end
