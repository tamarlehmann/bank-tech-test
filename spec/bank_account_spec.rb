require 'bank_account'

describe BankAccount do
  let(:balance) { 0 }
  let(:history) { double :history }
  let(:transaction) {double :transaction }
  subject(:account) { BankAccount.new(balance, history) }

  before do
    allow(history).to receive(:add_transaction).and_return(:transaction)
  end

  describe "::new" do
    it "Creates a new bank account with a balance of 0" do
      expect(account.balance).to eq(balance)
    end

    it "Creates a new bank account with an empty transaction history" do
      expect(account.transaction_history).to eq(history)
    end
  end

  describe "#deposit" do
    let(:deposit_amount) { 100 }

    it "Increases account balance with value of the deposit" do
      expect{ account.deposit(deposit_amount) }.to change{ account.balance }.by(deposit_amount)
    end

    it "Outputs deposit success message" do
      expect(account.deposit(deposit_amount)).to eq("You have successfully credited £#{deposit_amount}. Account balance is £#{account.balance}")
    end
  end

  describe "#withdrawal" do
    let(:deposit_amount) { 20 }
    let(:withdrawal_amount) { 20 }
    let(:large_withdrawal_amount) { 25 }

    before do
      account.deposit(deposit_amount)
    end

    it "Decreases account balance with value of the withdrawal" do
      expect{ account.withdrawal(withdrawal_amount) }.to change{ account.balance }.by(-withdrawal_amount)
    end

    it "Outputs withdrawal success message" do
      expect(account.withdrawal(withdrawal_amount)).to eq("You have successfully debited £#{withdrawal_amount}. Account balance is £#{account.balance}")
    end

    it "Does not allow withdrawal when there are insufficient funds" do
      message = "You have insufficient funds, the maximum you can withdraw is #{account.balance}"
      expect{ account.withdrawal(large_withdrawal_amount)}.to raise_error(message)
    end
  end

  describe "#print_statement" do
    it "Creates a new instance of Bank Statement" do
      expect(account).to respond_to(:print_statement).with(1).argument
    end
  end
end
