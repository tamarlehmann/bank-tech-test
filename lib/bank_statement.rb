class BankStatement
  attr_reader :contents

  def initialize(history)
    @contents = history
  end

  def print_statement
    print print_header + print_body
  end

  private

  def print_header
    header = ""
    header += "Date".ljust(11) + "||"
    header += "Credit".ljust(8) + "||"
    header += "Debit".ljust(8) + "||"
    header += "Balance\n".ljust(8)
    header
  end

  def print_body
    row_text = ""
    @contents.reverse.each do |transaction|
      row_text += "#{transaction.date}".ljust(11) + "||"
      if transaction.transaction_type == "credit"
        row_text += float("#{transaction.transaction_amount}").ljust(8) + "||" + " ".ljust(8) + "||"
      else
        row_text += " ".ljust(8) + "||" + float("#{transaction.transaction_amount}").ljust(8) + "||"
      end
      row_text += float("#{transaction.account_balance}").ljust(8) + "\n"
    end
    row_text
  end

  def float(number)
    sprintf('%.2f', number)
  end
end
