require 'bank_statement'

describe BankStatement do
  let(:transaction) { double :transaction, account_balance: 50, transaction_amount: 50, date: "07/03/2017", transaction_type: "credit" }
  let(:transaction_history) { double :transaction_history, transactions: [transaction] }
  subject(:statement) { BankStatement.new([transaction]) }


  describe "::new" do
    it "Creates a new statement with transaction history to be printed" do
      expect(statement.contents).to eq([transaction])
    end
  end


  describe "#print_statement" do

    it "Prints bank statement body" do
      body = "07/03/2017 ||50.00   ||        ||50.00  "
      expect{statement.print_statement}.to output{body}.to_stdout
    end

    it "Prints bank statement header" do
      header = "Date       ||Credit  ||Debit   ||Balance"
      expect{statement.print_statement}.to output{header}.to_stdout
    end

    it "Prints whole bank statement" do
      header = "Date       ||Credit  ||Debit   ||Balance\n"
      body = "07/03/2017 ||50.00   ||        ||50.00   \n"
      expect{statement.print_statement}.to output{header + body}.to_stdout
    end
  end
end
