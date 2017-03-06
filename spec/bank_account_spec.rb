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

  describe "#withdrawal" do
    let(:deposit_amount) { 20 }
    let(:withdrawal_amount) { 20 }
    let(:large_withdrawal_amount) { 21 }

    before do
      account.deposit(deposit_amount)
    end

    it "Decreases account balance with value of the withdrawal" do
      expect{ account.withdrawal(withdrawal_amount) }.to change{ account.balance }.by(-withdrawal_amount)
    end

    it "Does not allow withdrawal when there are insufficient funds" do
      message = "You have insufficient funds, the maximum you can withdraw is #{account.balance}"
      expect{ account.withdrawal(large_withdrawal_amount)}.to raise_error(message)
    end
  end
end
