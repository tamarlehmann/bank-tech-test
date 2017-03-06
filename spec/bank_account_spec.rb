require 'bank_account'

describe BankAccount do
  let(:balance) { 0 }
  subject(:account) { BankAccount.new(balance) }

  describe "::new" do
    it "Creates a new bank account with a balance of 0" do
      expect(account.balance).to eq(balance)
    end
  end

  describe "#deposit" do
    let(:deposit_amount) { 100 }

    it "Increases account balance with value of the deposit" do
      expect{ account.deposit(deposit_amount) }.to change{ account.balance }.by(deposit_amount)
    end
  end
end
