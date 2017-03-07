# Bank Tech Test ![Travis CI](https://travis-ci.org/tamarlehmann/bank-tech-test.svg?branch=master) [![Coverage Status](https://coveralls.io/repos/github/tamarlehmann/bank-tech-test/badge.svg?branch=master)](https://coveralls.io/github/tamarlehmann/bank-tech-test?branch=master)

This project is a Ruby application designed to mimic the basic functionality of a bank: withdrawals, deposits and viewing a bank statement. Written solo as an example tech test during Makers Academy Week 10.

## User Stories

```
As a user,
So that I can use a bank's services,
I want to be able to create a new bank account with a balance of zero.

As a user,
So that I can see how much money is in my account,
I want to be able to view my account balance.

As a user,
So that I store money in the bank,
I want to be able to deposit money into my account.

As a user,
So that I can spend the money I have in the bank,
I want to be able to withdraw money from my account.

As a user,
So that I cannot spend money I don't have,
I don't want to be able to withdraw money if my balance is 0.

As a user,
So I can see a list of my transactions,
I want to be able to view a printed bank statement.

As a user,
So that I can keep track of my account activity,
I want to be able to see an associated date with each transaction.

As a user,
So that I can keep track of my account activity,
I want to be able to see whether each transaction was a deposit or withdrawal.

As a user,
So that I can keep track of my account activity,
I want to see my updated account balance after every transaction.
```

## Domain Model

| Objects | Messages |
| -------- | -------- |
| User     |          |
| Account | view_balance |
| Transactions | deposit/withdraw |
| Statement | print_statement|


## Installation Instructions

* Clone this repo.
* Run `bundle install` in the project root directory.

## Running The Code

* This project is a command-line tool. Start up `IRB`.
* Require the file `require './lib/bank_account.rb'`
* Create a bank account `account = BankAccount.new`
* Deposit an amount `account.deposit(100)`
* See a confirmation message `"You have successfully credited £100. Account balance is £100"`
* Withdraw an amount `account.withdrawal(20)`
* See a confirmation message `"You have successfully debited £20. Account balance is £80"`
* Print a bank statement `account.print_statement`
* See a statement output:
`Date       ||Credit  ||Debit   ||Balance
07/03/2017 ||        ||20.00   ||80.00   
07/03/2017 ||100.00  ||        ||100.00 `

## Running The Tests

* Run `rspec` in the command-line.
* See 19 tests.

## To Implement...

If I had more time I would:
  - Ensure you cannot deposit/withdraw negative values.
  - Write better unit tests for bank statement, with properly mocked elements.
