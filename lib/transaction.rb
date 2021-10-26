# frozen_string_literal: true

require 'Date'

# Creates transactions (either depsoits or withdrawals)
class Transaction
  def create(type, amount)
    { type: type, date: transaction_date, amount: amount.round(2) }
  end

  private

  def transaction_date
    date = Date.today.to_s
    Date.parse(date).strftime('%d/%m/%Y').to_s
  end
end
