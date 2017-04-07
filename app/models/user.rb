class User
  include Mongoid::Document
  include Mongoid::Timestamps

  #attributes
  field :name, type: String, default: 'new_user'
  field :email, type: String
  field :amount_final, type: Float, default: 0.0
  field :friend_ids, type: Array, default: []

  #association
  has_many :events
  has_many :payments

  has_many :payment_from, class_name: 'Transaction', inverse_of: :payer
  has_many :payment_to, class_name: 'Transaction', inverse_of: :payee


  #validations
  validates_presence_of :name

end
