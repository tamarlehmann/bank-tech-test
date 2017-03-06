require_relative 'transaction'

class BankAccount
  attr_reader :balance
  MIN_BALANCE = 0

  def initialize(balance)
    @balance = balance
  end

  def deposit(amount)
    @balance += amount
    transaction = Transaction.new(@balance, amount)
    transaction.credit_transaction
  end

  def withdrawal(amount)
    message = "You have insufficient funds, the maximum you can withdraw is #{balance}"
    raise message if (balance - amount) < MIN_BALANCE
    @balance -= amount
    transaction = Transaction.new(@balance, amount)
    transaction.debit_transaction
    p transaction
  end

end
