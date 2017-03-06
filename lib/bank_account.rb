class BankAccount
  attr_reader :balance
  MIN_BALANCE = 0

  def initialize(balance)
    @balance = balance
  end

  def deposit(amount)
    @balance += amount
  end

  def withdrawal(amount)
    message = "You have insufficient funds, the maximum you can withdraw is #{balance}"
    raise message if (balance - amount) < MIN_BALANCE
    @balance -= amount
  end

end
