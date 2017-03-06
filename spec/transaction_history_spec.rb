require 'bank_account'

describe TransactionHistory do
  subject(:history) { TransactionHistory.new }

  describe "::new" do
    it "Creates an empty transaction history" do
      expect(history.transactions).to be_empty
    end
  end

  describe "#add_transaction" do
    let(:transaction) { 100 }
    it "Adds the transaction to the transaction_history" do
      history.add_transaction(transaction)
      expect(history.transactions.length).to eq(1)
    end
  end
end
