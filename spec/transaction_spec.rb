require 'transaction'

describe Transaction do
  subject(:transaction) { Transaction.new }

  describe "::new" do
    it "creates a new transaction" do
      expect(transaction).to be_instance_of(Transaction)
    end
  end
end
