class BankStatement
  attr_reader :contents

  def initialize(history)
    @contents = history
  end
  
end
