require 'bank_account'

describe 'Bank FeatureTest' do
  account = BankAccount.new
  account.deposit(50)
  account.deposit(50)
  account.withdrawal(20)
  it "Prints full statement" do
    output = "Date       ||Credit  ||Debit   ||Balance\n07/03/2017 ||        ||20.00   ||80.00\n07/03/2017 ||50.00   ||        ||100.00\n07/03/2017 ||50.00   ||        ||50.00"
    expect{account.print_statement}.to output{output}.to_stdout
  end
end
