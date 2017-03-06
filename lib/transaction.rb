class Transaction
  attr_reader :transaction_amount, :account_balance

  def initialize(balance, amount)
    @account_balance = balance
    @transaction_amount = amount
  end

end
