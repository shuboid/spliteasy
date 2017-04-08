class Payment
  include Mongoid::Document
  include Mongoid::Timestamps

  #attribute
  field :amount

  #association
  belongs_to :event
  belongs_to :user

  has_many :transaction

  #Validation
  validates_presence_of :amount

end
