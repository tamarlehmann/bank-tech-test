class BankStatement
  attr_reader :contents

  def initialize(history)
    @contents = history
  end

  def print_statement
    print_header
    print_body
  end

  private

  def print_header
    header = ""
    header += "Date".ljust(11) + "||"
    header += "Credit".ljust(8) + "||"
    header += "Debit".ljust(8) + "||"
    header += "Balance\n".ljust(8)
    puts header
  end

  def print_body
    row_text = ""
    @contents.reverse.each do |transaction|
      row_text += "#{transaction.date}".ljust(11) + "||"
      if transaction.transaction_type == "credit"
        row_text += "#{transaction.transaction_amount}".ljust(8) + "||" + " ".ljust(8) + "||"
      else
        row_text += " ".ljust(8) + "||" + "#{transaction.transaction_amount}".ljust(8) + "||"
      end
      row_text += "#{transaction.account_balance}".ljust(8) + "\n"
    end
    puts row_text
  end
end
