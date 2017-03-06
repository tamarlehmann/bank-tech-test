require 'transaction'

describe Transaction do
  let(:account_balance) { 100 }
  let(:transaction_amount) { 20 }
  let(:transaction_date) { "06/03/2017" }
  let(:transaction_type) { nil }
  subject(:transaction) { Transaction.new(account_balance, transaction_amount, transaction_date, transaction_type) }

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

    it "Creates a new transaction with an un-set transaction type" do
      expect(transaction.transaction_type).to eq(transaction_type)
    end
  end

  describe "Updating Transaction Type" do
    describe "#credit_transaction" do
      it "Updates transaction type to credit" do
        expect{ transaction.credit_transaction }.to change{ transaction.transaction_type }.from(nil).to("credit")
      end
    end

    describe "#debit_transaction" do
      it "Updates transaction type to debit" do
        expect{ transaction.debit_transaction }.to change{ transaction.transaction_type }.from(nil).to("debit")
      end
    end
  end
end
