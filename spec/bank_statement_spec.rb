require 'bank_statement'

describe BankStatement do
  subject(:history) { double :history }
  subject(:statement) { BankStatement.new(history) }


  describe "::new" do
    it "Creates a new statement with transaction history to be printed" do
      expect(statement.contents).to eq(history)
    end
  end
end
