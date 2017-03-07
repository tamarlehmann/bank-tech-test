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
    before do
      allow(statement).to receive(:print_statement).and_return(print_header + print_body)
    end

    it "Prints bank statement body" do
      body = "07/03/2017 ||50.00   ||        ||50.00  "
      expect(statement.print_statement).to include(body)
    end

    it "Prints bank statement header" do
      header = "Date       ||Credit  ||Debit   ||Balance"
      expect(statement.print_statement).to include(header)
    end

    it "Prints whole bank statement" do
      header = "Date       ||Credit  ||Debit   ||Balance"
      body = "07/03/2017 ||50.00   ||        ||50.00  "
      expect(statement.print_statement).to eq(header + body)
    end
  end
end
