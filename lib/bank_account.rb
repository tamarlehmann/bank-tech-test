require_relative 'transaction'
require_relative 'transaction_history'
require_relative 'bank_statement'

class BankAccount
  attr_reader :balance, :transaction_history
  MIN_BALANCE = 0

  def initialize(balance = 0, history = TransactionHistory.new)
    @balance = balance
    @transaction_history = history
  end

  def deposit(amount)
    @balance += amount
    @transaction = Transaction.new(@balance, amount)
    @transaction.credit_transaction
    complete_transaction(@transaction, amount)
  end

  def withdrawal(amount)
    message = "You have insufficient funds, the maximum you can withdraw is #{balance}"
    raise message if insufficient_funds?(amount)
    @balance -= amount
    @transaction = Transaction.new(@balance, amount)
    @transaction.debit_transaction
    complete_transaction(@transaction, amount)
  end

  def print_statement
    BankStatement.new(@transaction_history.transactions).print_statement
  end

  private

  def complete_transaction(transaction, amount)
    @transaction_history.add_transaction(transaction)
    "You have successfully #{transaction.transaction_type}ed £#{amount}. Account balance is £#{@balance}"
  end

  def insufficient_funds?(amount)
    (@balance - amount) < MIN_BALANCE
  end

end
