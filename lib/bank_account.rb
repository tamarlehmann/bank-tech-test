require_relative 'transaction'

class BankAccount
  attr_reader :balance, :transaction_history
  MIN_BALANCE = 0

  def initialize(balance, history = [])
    @balance = balance
    @transaction_history = history
  end

  def deposit(amount)
    @balance += amount
    @transaction = Transaction.new(@balance, amount)
    @transaction.credit_transaction
    complete_transaction
  end

  def withdrawal(amount)
    message = "You have insufficient funds, the maximum you can withdraw is #{balance}"
    raise message if (balance - amount) < MIN_BALANCE
    @balance -= amount
    @transaction = Transaction.new(@balance, amount)
    @transaction.debit_transaction
    complete_transaction
  end

  private

  def complete_transaction
    @transaction_history.push(@transaction)
  end

end
