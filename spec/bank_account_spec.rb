require 'bank_account'

describe BankAccount do
  describe "::new" do
    let(:balance) { 0 }
    subject(:account) { BankAccount.new(balance) }

    it "Creates a new bank account with a balance of 0" do
      expect(account.balance).to eq(balance)
    end
  end
end
