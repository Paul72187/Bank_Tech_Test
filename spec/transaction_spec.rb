# frozen_string_literal: true

require 'transaction'

describe Transaction do
  it { should respond_to(:create).with(2).arguments }

  describe '.create' do
    it 'creates a transaction (either deposit or withdrawal), date and amount' do
      allow(Date).to receive(:today).and_return('2023-01-10')
      expect(subject.create(:deposit, 10.00)).to eq({ type: :deposit, date: '10/01/2023', amount: 10.00 })
    end
  end
end
