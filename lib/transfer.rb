class Transfer
    attr_accessor :sender, :receiver, :status, :amount, :bank_account
    def initialize(sender,receiver,status = "pending", amount)
      @sender = sender 
      @receiver = receiver
      @status = status
      @amount = amount
    end 
    def valid?
      self.sender.valid? && self.receiver.valid? 
    end 

    def execute_transaction
      if self.status == "pending" && self.sender.balance > self.amount && self.valid?
        self.receiver.balance += self.amount
        self.sender.balance -= self.amount
        self.status = "complete"
      else 
        self.status = "rejected"
        "Transaction rejected. Please check your account balance."
      end
    end

    def reverse_transfer
      if self.execute_transaction 
      self.receiver.balance -= self.amount
      self.sender.balance += self.amount
      self.status = "reversed"
      end 
    end 
end 