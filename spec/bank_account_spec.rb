# frozen_literal_string: true

describe BankAccount do
  before(:each) do
    allow(Date).to receive(:today).and_return('2023-01-10')
    allow(Transaction).to receive(:new).and_return(transaction)
  end
end
