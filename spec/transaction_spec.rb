require 'transaction'

describe Transaction do
  let(:account_balance) { 100 }
  let(:transaction_amount) { 20 }
  let(:transaction_date) { "06/03/2017" }
  subject(:transaction) { Transaction.new(account_balance, transaction_amount, transaction_date) }

  describe "::new" do
    it "Creates a new transaction with the transaction amount" do
      expect(transaction.transaction_amount).to eq(transaction_amount)
    end

    it "Creates a new transaction with the updated account balance" do
      expect(transaction.account_balance).to eq(account_balance)
    end

    it "Stores the associated transaction date with each transaction" do
      expect(transaction.date).to eq(transaction_date)
    end
  end
end
