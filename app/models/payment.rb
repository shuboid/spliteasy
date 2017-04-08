class Payment
  include Mongoid::Document
  include Mongoid::Timestamps

  after_create :make_transactions

  #attribute
  field :amount

  #association
  belongs_to :event
  belongs_to :user


  #Validation
  validates_presence_of :amount


  def make_transactions
    event = Event.find(self.event_id)
    event_members = event.user_ids
    members_count = event_members.count
    payer = self.user.id

    event_members.delete(payer)
    amount = self.amount.to_i / members_count
    event_members.each do |payee|
      Transaction.create(payee:payee,payer:payer,amount:amount)
    end
  end

end
