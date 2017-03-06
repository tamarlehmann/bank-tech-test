class Transaction
  attr_reader :transaction_amount, :account_balance, :date

  def initialize(balance, amount, date = Time.now.strftime("%d/%m/%Y"))
    @account_balance = balance
    @transaction_amount = amount
    @date = date
  end

end
