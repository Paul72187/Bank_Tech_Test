# frozen_string_literal: true

require_relative 'transaction'

class BankAccount
  def initialize
    @transactions = []
  end

  def deposit(amount)
    @transactions << Transaction.new.create(:deposit, amount)
  end
end
