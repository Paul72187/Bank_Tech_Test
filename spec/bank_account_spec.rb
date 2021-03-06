# frozen_string_literal: true

require 'bank_account'

describe BankAccount do
  let(:not_float_error) { 'Amount should be stated in pounds and pence to two decimal places' }
  let(:negative_error) { 'Amount deposited must exceed 0.00' }
  let(:insufficient_funds_error) { 'You have insufficient funds for this withdrawal' }
  let(:transaction) { instance_double('Transaction') }

  before(:each) do
    allow(Date).to receive(:today).and_return('2023-01-10')
    allow(Transaction).to receive(:new).and_return(transaction)
  end

  it { is_expected.to respond_to(:deposit).with(1).arguments }
  it { is_expected.to respond_to(:withdrawal).with(1).arguments }
  it { is_expected.to respond_to(:print_statement).with(0).arguments }

  describe '.deposit' do
    context 'approved' do
      it 'allows deposits to be made in pounds and pence to two decimal places' do
        allow(transaction).to receive(:create).and_return({ type: :deposit, date: '10/01/2023', amount: 20.00 })
        expect { subject.deposit(20.00) }.not_to raise_exception
      end

      it 'returns approval alert when deposit is approved' do
        allow(transaction).to receive(:create).and_return({ type: :depsit, date: '13/01/2023', amount: 20.00 })
        expect(subject.deposit(20.00)).to eq 'Your deposit has been approved'
      end
    end

    context 'rejected' do
      it 'displays error when amount not displayed as a floating value' do
        expect { subject.deposit('Bank Deposit') }.to raise_exception(RuntimeError, not_float_error)
      end

      it 'displays error when amount is displayed as a floating value but not to two decimal places' do
        expect { subject.deposit(20.001) }.to raise_exception(RuntimeError, not_float_error)
      end

      it 'displays error when amount not displayed as positive value to two decimal places' do
        expect { subject.deposit(-20.00) }.to raise_exception(RuntimeError, negative_error)
      end
    end
  end

  describe '.withdrawal' do
    before(:each) do
      allow(transaction).to receive(:create).and_return({ type: :deposit, date: '13/01/2023', amount: 1500.00 })
      subject.deposit(1500.00)
    end

    context 'approved' do
      it 'allows withdrawals to be made in pounds and pence to two decimal places' do
        allow(transaction).to receive(:create).and_return({ type: :withdrawal, date: '14/01/2023', amount: 4.50 })
        expect { subject.withdrawal(4.50) }.not_to raise_exception
      end

      it 'returns approval alert when withdrawal is approved' do
        allow(transaction).to receive(:create).and_return({ type: :withdrawal, date: '14/01/2023', amount: 4.50 })
        expect(subject.withdrawal(4.50)).to eq 'Your withdrawal has been approved'
      end
    end

    context 'rejected' do
      it 'displays error when amount not displayed as a floating value' do
        expect { subject.withdrawal('Bank Deposit') }.to raise_exception(RuntimeError, not_float_error)
      end

      it 'displays error when amount is displayed as a floating value but not to two decimal places' do
        expect { subject.withdrawal(20.001) }.to raise_exception(RuntimeError, not_float_error)
      end

      it 'displays error when amount not displayed as positive value to two decimal places' do
        expect { subject.withdrawal(-20.00) }.to raise_exception(RuntimeError, negative_error)
      end

      it 'displays error when trying to withdraw a greater amount than the current bank balance' do
        expect(subject.withdrawal(5000.00)).to eq(insufficient_funds_error)
      end
    end
  end
end
