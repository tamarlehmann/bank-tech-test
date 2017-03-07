require 'bank_statement'

describe BankStatement do
    let(:transaction_history) { double :transaction_history }
    let(:print_body) { "07/03/2017 ||50.00   ||        ||50.00  " }
    let(:print_header) { "Date       ||Credit  ||Debit   ||Balance" }
    subject(:statement) { BankStatement.new(transaction_history) }


  describe "::new" do
    it "Creates a new statement with transaction history to be printed" do
      expect(statement.contents).to eq(transaction_history)
    end
  end

  describe "#print_statement" do
    account = BankAccount.new
    account.deposit(50)
    account.deposit(50)
    account.withdrawal(20)
    it "Prints full statement" do
      output = "Date       ||Credit  ||Debit   ||Balance\n07/03/2017 ||        ||20.00   ||80.00\n07/03/2017 ||50.00   ||        ||100.00\n07/03/2017 ||50.00   ||        ||50.00"
      expect{account.print_statement}.to output{output}.to_stdout
    end
  end
end
