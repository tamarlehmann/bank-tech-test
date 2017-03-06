class Transaction
  attr_reader :transaction_amount, :account_balance, :date, :transaction_type

  def initialize(balance, amount, date = Time.now.strftime("%d/%m/%Y"), type = nil)
    @account_balance = balance
    @transaction_amount = amount
    @date = date
    @transaction_type = type
  end

end
